---
title: "HTB Machines for OSEP/PEN-300 Preparation: Complete Attack Chain Mapping"
date: 2023-04-27
lastmod: 2025-06-13
description: "Curated list of HTB machines mapped to every PEN-300 syllabus topic: client-side execution, AV evasion, AD exploitation, MSSQL abuse, lateral movement and more. Includes TJNull OSEP-like list."
categories: [research, red-team]
tags: [osep, pen-300, htb, red-team, penetration-testing, active-directory, av-evasion]
author: z-r0crypt
featured: false
draft: false
summary: "HTB machines mapped to every PEN-300 syllabus topic. From Office macros to Kerberos delegation — covers client-side execution, AV evasion, AD exploitation, MSSQL, lateral movement and more."
---

## Overview

This is a curated mapping of Hack The Box machines to PEN-300 (OSEP) syllabus topics. The goal is to give you targeted practice on each exam skill rather than grinding random machines.

**How to use:** Work sections in order — each builds on the previous. Don't skip to AD exploitation without doing AV evasion first.

**Audience:** OSEP exam candidates | **Updated:** June 2025 | **Difficulty:** Hard

> For the TJNull community OSEP-like list, see the [bottom of this post](#tjnull-osep-list).

---

## 1. Operating System and Programming Theory

Sections 1 and 2 of PEN-300 are foundational — Win32 API, WoW64, Windows Registry, process scheduling. No specific HTB machines map cleanly here but the knowledge underpins everything that follows. Focus on the course material for these two chapters.

---

## 2. Client-Side Code Execution with Office

| Attack Type | HTB Machine | Attack Used | Walkthrough |
|---|---|---|---|
| Phishing — RTF Document (CVE-2017-0199) | REEL | Malicious RTF via CVE-2017-0199 | [IppSec](https://youtube.com/watch?v=ob9SgtFm6_g&t=794) · [Tool](https://github.com/bhdresh/CVE-2017-0199) |
| Phishing — LibreOffice Macro | RE | LibreOffice macro execution | [IppSec](https://youtube.com/watch?v=YXAakamjO_I&t=1005) |
| Phishing — NTLMv2 capture via link | REEL2 | Malicious link to grab NTLMv2 hash | [IppSec](https://youtube.com/watch?v=Ro2vXt_WFDQ&t=2350) |
| Phishing — LibreOffice Macro | RABBIT | LibreOffice macro execution | [IppSec](https://youtube.com/watch?v=5nnJq_IWJog&t=1935) |

---

## 3. Client-Side Code Execution with JScript

| Attack Type | HTB Machine | Attack Used | Walkthrough |
|---|---|---|---|
| HTML Smuggling / JScript WSH | OUTDATED | Client-side attack via malicious document | [IppSec](https://www.youtube.com/watch?v=W2C5nZ8I9O8) |
| JScript execution via WSH | ANUBIS | Windows Script Host abuse | [IppSec](https://www.youtube.com/watch?v=Y2Y8PYFM57Y) |

---

## 4. Process Injection and Migration

| Attack Type | HTB Machine | Attack Used | Walkthrough |
|---|---|---|---|
| DLL Injection / Process Hollowing | HACKBACK | Process injection for persistence | [IppSec](https://youtube.com/watch?v=B9nozi1PrhY) |
| Process Migration via Meterpreter | JEEVES | Migrate between processes post-exploitation | [IppSec](https://www.youtube.com/watch?v=EKGBskG8APc) |
| Reflective DLL Injection | CEREAL | .NET deserialization leading to injection | [IppSec](https://www.youtube.com/watch?v=_qMfRiLBqnI) |

---

## 5. Introduction to Antivirus Evasion

| Attack Type | HTB Machine | Attack Used | Walkthrough |
|---|---|---|---|
| Macro obfuscation | RE | Obfuscating Office macro to bypass AV | [IppSec](https://youtube.com/watch?v=YXAakamjO_I&t=1005) |
| Basic shellcode obfuscation | OUTDATED | Shellcode runner with basic obfuscation | [IppSec](https://www.youtube.com/watch?v=W2C5nZ8I9O8) |

---

## 6. Advanced Antivirus Evasion

| Attack Type | HTB Machine | Attack Used | Walkthrough |
|---|---|---|---|
| AMSI Bypass | APT | AMSI bypass to run PS in constrained env | [IppSec](https://youtube.com/watch?v=eRnqtXwCZVs&t=4650) |
| AMSI Bypass | PIVOTAPI | AMSI bypass for PowerShell execution | [IppSec](https://youtube.com/watch?v=FbTxPz_GA4o&t=6360) |
| AMSI Bypass | MULTIMASTER | AMSI bypass during AD exploitation | [IppSec](https://youtube.com/watch?v=iwR746pfTEc) |
| EDR Evasion | SEKHMET | AV/EDR evasion via custom loader | [IppSec](https://youtube.com/watch?v=vsgPsMZx59w) |

---

## 7. Application Whitelisting

| Attack Type | HTB Machine | Attack Used | Walkthrough |
|---|---|---|---|
| AppLocker Bypass — ConstrainedLanguage | REEL2 | Breaking out of CLM by creating a function | [IppSec](https://youtube.com/watch?v=Ro2vXt_WFDQ&t=3600) |
| AppLocker Bypass — PSBypassCLM | GIDDY | PSBypassCLM to escape constrained mode | [IppSec](https://youtube.com/watch?v=J2unwbMQvUo&t=2750) |
| AppLocker Bypass — intended path | SEKHMET | Intended AppLocker bypass technique | [IppSec](https://youtube.com/watch?v=vsgPsMZx59w&t=6300) |
| AppLocker Bypass — COR Profiler | — | COR Profiler bypass technique | [IppSec](https://youtube.com/watch?v=T91iXd_VPVI&t=1650) |
| AppLocker Bypass | HATHOR | AppLocker bypass in hardened environment | [IppSec](https://www.youtube.com/watch?v=lGEjKnFpSDM) |

---

## 8. Bypassing Network Filters

This section is highly theoretical in the course — DNS tunnelling, ICMP tunnelling, HTTP/S proxying. The best HTB practice is:

| Attack Type | HTB Machine | Attack Used | Walkthrough |
|---|---|---|---|
| DNS Tunnelling | TENTACLE | DNS-based communication through restrictive firewall | [IppSec](https://youtube.com/watch?v=kKhuUXPmJ_o) |
| HTTP Tunnelling / Pivoting | ANUBIS | HTTP tunnelling through restricted network | [IppSec](https://www.youtube.com/watch?v=Y2Y8PYFM57Y) |
| Network pivoting | PIVOTAPI | Multi-hop pivoting through network segments | [IppSec](https://youtube.com/watch?v=FbTxPz_GA4o) |

---

## 9. Linux Post-Exploitation

| Attack Type | HTB Machine | Attack Used | Walkthrough |
|---|---|---|---|
| SSSD credential extraction | CERBERUS | SSSD config review, domain password extraction | [IppSec](https://www.youtube.com/watch?v=IX4h5aaSK1g&t=2160s) |
| SSSD credential extraction | SEKHMET | Dumping sssd.ldb, kinit for Kerberos ticket | [IppSec](https://youtube.com/watch?v=vsgPsMZx59w&t=2400) |
| Linux persistence / cron abuse | SEAL | Ansible playbook abuse for privilege escalation | [IppSec](https://www.youtube.com/watch?v=wCfztTcioU8&t=1260s) |
| Ansible abuse | INJECT | Ansible enumeration and privesc | [IppSec](https://www.youtube.com/watch?v=3VuIaUvHsTI&t=1320s) |

---

## 10. Windows Post-Exploitation

| Attack Type | HTB Machine | Attack Used | Walkthrough |
|---|---|---|---|
| LSASS Dump via rundll32 | ATOM | rundll32 memory dump of LSASS | [IppSec](https://youtube.com/watch?v=1OC2eRVX0ic&t=1830) |
| LSASS Dump via pypykatz | BLACKFIELD | pypykatz credential extraction from dump | [IppSec](https://youtube.com/watch?v=IfCysW0Od8w&t=2205) |
| SAM / SYSTEM dump | BASTION | secretsdump against SAM and SYSTEM hives | [IppSec](https://youtube.com/watch?v=2j3FNp5pjQ4&t=660) |
| LAPS password extraction | STREAMIO | Identifying and extracting LAPS password | [IppSec](https://youtube.com/watch?v=qKcUKlwoGw8&t=5300) |
| LAPS password extraction | PIVOTAPI | Discovering user who can add groups to LAPS | [IppSec](https://youtube.com/watch?v=FbTxPz_GA4o&t=5990) |
| UAC Bypass | ARKHAM | UAC bypass via deserialization | [IppSec](https://youtube.com/watch?v=krC5j1Ab44I&t=3340) |
| SeImpersonate Privilege | SCRAMBLED | Abusing SeImpersonate for privesc | [IppSec](https://youtube.com/watch?v=_8FE3JZIPfo&t=1800) |
| Token Impersonation — Incognito | HACKBACK | Incognito to grab impersonation token | [IppSec](https://youtube.com/watch?v=B9nozi1PrhY&t=11697) |

---

## 11. Kiosk Breakouts

This is one of the most niche sections in PEN-300 — breaking out of restricted environments like ATM interfaces or locked-down kiosk desktops. No dedicated HTB machines cover this well. Focus on the course material and practice with:

- Sticky Keys / Utilman bypass techniques
- Task Manager / Explorer shell replacement
- Constrained desktop breakout via file dialogs

---

## 12. Windows Credentials

*(See Windows Post-Exploitation above — sections overlap significantly)*

| Attack Type | HTB Machine | Attack Used | Walkthrough |
|---|---|---|---|
| AD object permissions | REEL | GenericWrite, WriteOwner, WriteDACL explained | [IppSec](https://youtube.com/watch?v=ob9SgtFm6_g&t=3205) |
| GenericAll abuse | SUPPORT | Abusing GenericAll object permission | [IppSec](https://youtube.com/watch?v=iIveZ-raTTQ&t=970) |

---

## 13. Windows Lateral Movement

| Attack Type | HTB Machine | Attack Used | Walkthrough |
|---|---|---|---|
| PsExec / SMB lateral movement | FLIGHT | SMB relay and lateral movement via PsExec | [IppSec](https://www.youtube.com/watch?v=qgzNQk2QTPI) |
| WinRM lateral movement | OUTDATED | WinRM for lateral movement post-exploit | [IppSec](https://www.youtube.com/watch?v=W2C5nZ8I9O8) |
| Pass-the-Hash | MULTIMASTER | PTH for lateral movement in AD | [IppSec](https://youtube.com/watch?v=iwR746pfTEc) |
| Pass-the-Ticket | SCRAMBLED | Kerberos ticket abuse for lateral movement | [IppSec](https://youtube.com/watch?v=_8FE3JZIPfo) |
| DCOM lateral movement | HATHOR | DCOM abuse in hardened environment | [IppSec](https://www.youtube.com/watch?v=lGEjKnFpSDM) |

---

## 14. Linux Lateral Movement

| Attack Type | HTB Machine | Attack Used | Walkthrough |
|---|---|---|---|
| DevOps — Ansible playbook abuse | SEAL | Ansible playbook for privilege escalation | [IppSec](https://www.youtube.com/watch?v=wCfztTcioU8&t=1260s) |
| DevOps — Ansible enumeration | INJECT | Ansible enumeration and privesc | [IppSec](https://www.youtube.com/watch?v=3VuIaUvHsTI&t=1320s) |
| Kerberos on Linux — keytab theft | TENTACLE | Configuring attacker Kerberos, stealing keytab | [IppSec](https://youtube.com/watch?v=kKhuUXPmJ_o&t=3870) |
| Kerberos on Linux — SSSD | CERBERUS | SSSD config review, domain password extraction | [IppSec](https://www.youtube.com/watch?v=IX4h5aaSK1g&t=2160s) |
| Kerberos on Linux — sssd.ldb dump | SEKHMET | Dumping sssd.ldb, kinit for Kerberos ticket | [IppSec](https://youtube.com/watch?v=vsgPsMZx59w&t=2400) |

---

## 15. Microsoft SQL Server

| Attack Type | HTB Machine | Attack Used | Walkthrough |
|---|---|---|---|
| MSSQL authentication in AD | ESCAPE | mssqlclient.py login, MSSQL enumeration | [IppSec](https://youtube.com/watch?v=PS2duvVcjws&t=390) |
| xp_cmdshell RCE | SCRAMBLED | Enabling xp_cmdshell for reverse shell | [IppSec](https://youtube.com/watch?v=_8FE3JZIPfo&t=1000) |
| xp_dirtree hash capture | STREAMIO | xp_dirtree to steal MSSQL service hash | [IppSec](https://youtube.com/watch?v=qKcUKlwoGw8&t=1335) |
| MSSQL linked servers | QUERIER | MSSQL linked server lateral movement | [IppSec](https://www.youtube.com/watch?v=QVfExqOSdpw) |

---

## 16. Active Directory Exploitation

| Attack Type | HTB Machine | Attack Used | Walkthrough |
|---|---|---|---|
| AD object permissions | REEL | GenericWrite, WriteOwner, WriteDACL | [IppSec](https://youtube.com/watch?v=ob9SgtFm6_g&t=3205) |
| GenericAll abuse | SUPPORT | GenericAll → RBCD for domain access | [IppSec](https://youtube.com/watch?v=iIveZ-raTTQ&t=970) |
| GenericAll + WriteDACL | MULTIMASTER | Chained AD permission abuse | [IppSec](https://youtube.com/watch?v=iwR746pfTEc&t=7410) |
| GenericWrite + WriteDACL | REEL | Taking ownership, changing user password | [IppSec](https://youtube.com/watch?v=ob9SgtFm6_g&t=3503) |
| Kerberos Delegation — Unconstrained | PIVOTAPI | Unconstrained delegation with SQL user, Rubeus tgtdeleg | [IppSec](https://youtube.com/watch?v=FbTxPz_GA4o&t=7215) |
| Kerberos Delegation — Unconstrained | INTELLIGENCE | Unconstrained delegation exploitation | [IppSec](https://secnigma.wordpress.com/2021/11/27/hack-the-box-intelligence/) |
| RBCD | SUPPORT | Resource-based constrained delegation | [IppSec](https://youtube.com/watch?v=iIveZ-raTTQ&t=970) |
| AS-REP Roasting | FOREST | AS-REP roast → hash crack → DA | [IppSec](https://www.youtube.com/watch?v=H9FcE_FMZio) |
| Kerberoasting | ACTIVE | SPN enumeration → TGS crack → DA | [IppSec](https://www.youtube.com/watch?v=jUc1J31DNdw) |
| DCSync | BLACKFIELD | DCSync for domain credential extraction | [IppSec](https://youtube.com/watch?v=IfCysW0Od8w) |
| Bloodhound AD enumeration | ESCAPE | BloodHound attack path analysis | [IppSec](https://youtube.com/watch?v=PS2duvVcjws) |

---

## TJNull OSEP List

Community-maintained OSEP preparation list by TJNull, with 0xdf writeups linked where available.

### OSEP-Like

| Machine | 0xdf Writeup |
|---|---|
| Haze | [writeup](https://0xdf.gitlab.io/2025/06/28/htb-haze.html) |
| EscapeTwo | [writeup](https://0xdf.gitlab.io/2025/05/24/htb-escapetwo.html) |
| Escape | [writeup](https://0xdf.gitlab.io/2023/06/17/htb-escape.html) |
| Absolute | [writeup](https://0xdf.gitlab.io/2023/05/27/htb-absolute.html) |
| Flight | [writeup](https://0xdf.gitlab.io/2023/05/06/htb-flight.html) |
| Sekhmet | [writeup](https://0xdf.gitlab.io/2023/04/01/htb-sekhmet.html) |
| Support | [writeup](https://0xdf.gitlab.io/2022/12/17/htb-support.html) |
| Outdated | [writeup](https://0xdf.gitlab.io/2022/12/10/htb-outdated.html) |
| Hathor | [writeup](https://0xdf.gitlab.io/2022/11/19/htb-hathor.html) |
| Scrambled | [writeup](https://0xdf.gitlab.io/2022/10/01/htb-scrambled.html) |
| StreamIO | [writeup](https://0xdf.gitlab.io/2022/09/17/htb-streamio.html) |
| Timelapse | [writeup](https://0xdf.gitlab.io/2022/08/20/htb-timelapse.html) |
| Forge | [writeup](https://0xdf.gitlab.io/2022/01/22/htb-forge.html) |
| Seal | [writeup](https://0xdf.gitlab.io/2021/11/13/htb-seal.html) |
| APT | [writeup](https://0xdf.gitlab.io/2021/04/10/htb-apt.html) |
| Multimaster | [writeup](https://0xdf.gitlab.io/2020/09/19/htb-multimaster.html) |
| Magic | [writeup](https://0xdf.gitlab.io/2020/08/22/htb-magic.html) |
| Monteverde | [writeup](https://0xdf.gitlab.io/2020/06/13/htb-monteverde.html) |
| Forest | [writeup](https://0xdf.gitlab.io/2020/03/21/htb-forest.html) |
| Querier | [writeup](https://0xdf.gitlab.io/2019/06/22/htb-querier.html) |

### OSEP-Harder

| Machine | 0xdf Writeup |
|---|---|
| Scepter | [writeup](https://0xdf.gitlab.io/2025/07/19/htb-scepter.html) |
| Absolute | [writeup](https://0xdf.gitlab.io/2023/05/27/htb-absolute.html) |
| Search | [writeup](https://0xdf.gitlab.io/2022/04/30/htb-search.html) |
| Anubis | [writeup](https://0xdf.gitlab.io/2022/01/29/htb-anubis.html) |
| PivotAPI | [writeup](https://0xdf.gitlab.io/2021/11/06/htb-pivotapi.html) |
| Monteverde | [writeup](https://0xdf.gitlab.io/2020/06/13/htb-monteverde.html) |
| Sizzle | [writeup](https://0xdf.gitlab.io/2019/06/01/htb-sizzle.html) |

---

## Further Resources

- [TJNull's full OSEP prep spreadsheet](https://docs.google.com/spreadsheets/u/1/d/1dwSMIAPIam0PuRBkCiDI88pU3yzrqqHkDtBngUHNCw8/pubhtml)
- [chvancooten/OSEP-Code-Snippets](https://github.com/chvancooten/OSEP-Code-Snippets) — most useful code reference for OSEP
- [deletehead/pen_300_osep_prep](https://github.com/deletehead/pen_300_osep_prep) — solid community prep guide
- [0xdf OSEP machine writeups](https://0xdf.gitlab.io/cheatsheets/offsec) — best quality writeups for the list above