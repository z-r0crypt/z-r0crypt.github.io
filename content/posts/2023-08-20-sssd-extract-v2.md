---
title: "SSSD-Extract: Dumping Active Directory Hashes from Linux Systems"
date: 2023-08-20T00:00:00Z
lastmod: 2025-01-15
draft: false
author: "z-r0crypt"
description: "Open-source tool for extracting cached AD credentials and NTLM hashes from SSSD on Linux systems. Post-exploitation for domain compromise."
categories: ["research", "tools", "red-team"]
tags: ["sssd", "active-directory", "post-exploitation", "linux", "credential-dumping", "ntlm"]
featured: true
summary: "SSSD-Extract tool: dump AD account hashes, group memberships, and user accounts from Linux systems with SSSD credential caching enabled."
---

**Requirements:** Root access | Linux with SSSD (Ubuntu 18.04+, RHEL, CentOS) | tdbdump installed

**Impact:** Lateral movement on Domain-joined Linux systems | Hash cracking with Hashcat/John

**GitHub:** https://github.com/z-r0crypt/SSSD-extract

---

Using this bash script it is possible to extract Active Directory accounts hashes when credential caching is enabled in SSSD.

```sh
$ zsh sssd-extract.sh [$FolderPath]
```

Without input arguments it takes the SSSD default path ***`/var/lib/sss/db/`*** but you can use a different one. 
If tdbdump is not installed it just lists the ldb files which contain the hashes, you can install it ***`apt install tdb-tools`*** or exfiltrate these files:

![](https://raw.githubusercontent.com/ricardojoserf/ricardojoserf.github.io/master/images/SSSD-creds/image1.png)

**In a system with tdbdump installed the script will:**

1. Extracts cached accounts and hashes, dumping the results to the file ***`hashes.txt`***. The hashes can then be cracked using Hashcat or John the Ripper:

```cmd
john hashes.txt --format=sha512crypt
```

2. Extract all the AD groups, Users and Machine accounts cached in the ldb file and save it to ***`domain.txt`***

**`*Note: Better approach would be to copy the ldb file to you attacking machine and run the script there.`**

### Credit
+ ricardojoserf/SSSD-creds


<br>    
  
-----------------------------------------------------------------------------------------------
