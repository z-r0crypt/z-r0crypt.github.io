---
layout: post
title:  "HTB Machines for OSEP Preparation"
date:   2023-04-27 22:10:36 -0500
categories:  [Red Team, Defense Evasion]
tags: [ OSEP,ETBD, Red Team, Defense Evasion, Offensive Security, Certification ]
---

## HTB Machines for OSEP Preparation
List of HTB (Hack the Box) Machines to prepare for OSEP Exam (PEN-300) by offensive security.

<b><details><summary>3. Client Side Code Execution With Office </summary></b>

| Attack Type | HTB Machine | Attack Used in HTB | Link |
|:---:|:---:|:---:|:---|
| Phishing with Microsoft Office: RTF Document | REEL | malicious RTF Document (CVE-2017-0199) | Walkthrough : https://youtube.com/watch?v=ob9SgtFm6_g&t=794 <br> Tool: https://github.com/bhdresh/CVE-2017-0199 |
| Phishing with Microsoft Office: LibreOffice | RE | LibreOffice Macro | Walkthrough : https://youtube.com/watch?v=ob9SgtFm6_g&t=794 <br> Tool: <> |
| Phishing/Macro | REEL2 | Grab NTLMv2 with Malicious link | Walkthrough : https://youtube.com/watch?v=Ro2vXt_WFDQ&t=2350 <br> Tool: <> |
| Phishing with Microsoft Office: LibreOffice | RABBIT | LibreOffice Macro | Walkthrough : https://youtube.com/watch?v=5nnJq_IWJog&t=1935 <br> Tool: <> |
</details>

<b><details><summary>4. Client Side Code Execution With Windows Script Host </summary></b>

| Attack Type | HTB Machine | Attack Used in HTB | Link |
|:---:|:---:|:---:|:---:|
| | | | |
</details>


<b><details><summary>5. Process Injection and Migration </summary></b>

| Attack Type | HTB Machine | Attack Used in HTB | Link |
|:---:|:---:|:---:|:---:|
| | | | |
</details>

<b><details><summary>6. Introduction to Antivirus Evasion </summary></b>

| Attack Type | HTB Machine | Attack Used in HTB | Link |
|:---:|:---:|:---:|:---:|
| Obfuscating Macro | RE | | Walkthrough : https://youtube.com/watch?v=YXAakamjO_I&t=1005 | 
</details>

<b><details><summary>7. Advanced Antivirus Evasion </summary></b>

| Attack Type | HTB Machine | Attack Used in HTB | Link |
|:---:|:---:|:---:|:---:|
| Amsi Bypass | APT | | Walkthrough : https://youtube.com/watch?v=eRnqtXwCZVs&t=4650 |
| Amsi Bypass | PivotAPI | | Walkthrough : [https://youtube.com/watch?v=eRnqtXwCZVs&t=4650](https://youtube.com/watch?v=FbTxPz_GA4o&t=6360) |
| Amsi Bypass | MULTIMASTER | | | Walkthrough : https://youtube.com/watch?v=iwR746pfTEc&t=6814 |
</details>


<b><details><summary>8. Application Whitelisting </summary></b>

| Attack Type | HTB Machine | Attack Used in HTB | Link |
|:---:|:---:|:---:|:---:|
| Applocker Bypass | REEL2 | Breaking out of ConstrainedLanguage Mode by creating a function | Walkthrough : https://youtube.com/watch?v=Ro2vXt_WFDQ&t=3600 |
| Applocker Bypass | GIDDY | Escaping powershell constrained mode with PSBypassCLM | Walkthrough : [https://youtube.com/watch?v=Ro2vXt_WFDQ&t=360](https://youtube.com/watch?v=J2unwbMQvUo&t=2750)0 |
| Applocker Bypass | SEKHMET |  intended way of bypassing applocker  | Walkthrough : https://youtube.com/watch?v=vsgPsMZx59w&t=6300 |
| Applocker Bypass | - | AppLocker Bypass COR Profiler | Walkthrough : [https://youtube.com/watch?v=Ro2vXt_WFDQ&t=3600](https://youtube.com/watch?v=T91iXd_VPVI&t=1650) |
</details>


<b><details><summary>9. Bypassing Network Filters </summary></b>

| Attack Type | HTB Machine | Attack Used in HTB | Link |
|:---:|:---:|:---:|:---:|
| | | | |
</details>



<b><details><summary>10. Linux Post-Exploitation </summary></b>

| Attack Type | HTB Machine | Attack Used in HTB | Link |
|:---:|:---:|:---:|:---:|
| | | | |
</details>


<b><details><summary>11. Kiosk Breakouts </summary></b>

| Attack Type | HTB Machine | Attack Used in HTB | Link |
|:---:|:---:|:---:|:---:|
| | | | |
</details>

<b><details><summary>12. Windows Credentials </summary></b>

| Attack Type | HTB Machine | Attack Used in HTB | Link |
|:---:|:---:|:---:|:---:|
| Local Windows Credentials: LSASS Dump | ATOM | Using rundll32 to create a memory dump of LSASS | Walkthrough : https://youtube.com/watch?v=1OC2eRVX0ic&t=1830 |
| Local Windows Credentials: LSASS Dump | BLACKFIELD | running pypykatz to extract credentials | Walkthrough : [https://youtube.com/watch?v=1OC2eRVX0ic&t=1830](https://youtube.com/watch?v=IfCysW0Od8w&t=2205) |
| Local Windows Credentials: SAM Dump | BASTION | Extracting local passwords from SAM and SYSTEM with secretsdump | Walkthrough : https://youtube.com/watch?v=2j3FNp5pjQ4&t=660 |
| Local Windows Credentials: LAPS | STREAMIO | Identifying and Extracting the LAPS Password | Walkthrough : [https://youtube.com/watch?v=B9nozi1PrhY&t=11697](https://youtube.com/watch?v=qKcUKlwoGw8&t=5300) |
| Local Windows Credentials: LAPS | PivotAPI | Discovering a user who can add groups to LAPS | Walkthrough : https://youtube.com/watch?v=FbTxPz_GA4o&t=5990 |
| Access Tokens: UAC | ARKHAM | UAC Bypass | Walkthrough : https://youtube.com/watch?v=krC5j1Ab44I&t=3340 |
| Access Tokens: SeImpersonate | SCRAMBLED | Abusing SeImpersonate Privilege | Walkthrough : [https://youtube.com/watch?v=2j3FNp5pjQ4&t=660](https://youtube.com/watch?v=_8FE3JZIPfo&t=1800) |
| Access Tokens: Incognito | HACKBACK | Using incognito to grab our impersonation token for HACKER user | Walkthrough : https://youtube.com/watch?v=B9nozi1PrhY&t=11697 |
</details>


<b><details><summary>13. Windows Lateral Movement </summary></b>

| Attack Type | HTB Machine | Attack Used in HTB | Link |
|:---:|:---:|:---:|:---:|
| | | | |
</details>

<b><details><summary>14. Linux Lateral Movement </summary></b>

| Attack Type | HTB Machine | Attack Used in HTB | Link |
|:---:|:---:|:---:|:---:|
| DevOps | SEAL | Abusing ansible playbook | Walkthrough: https://www.youtube.com/watch?v=wCfztTcioU8&t=1260s |
| DevOps | INJECT | Ansible enumeration and privilege escalation | Walkthrough: https://www.youtube.com/watch?v=3VuIaUvHsTI&t=1320s |
| Kerberos on Linux | TENTACLE | Configuring our attacker's box kerberos to connect to Tentacle's KDC, and steal keytab | Walkthrough : https://youtube.com/watch?v=kKhuUXPmJ_o&t=3870 |
| Kerberos on Linux | CERBERUS | examine the SSSD configuration and get a domain password | Walkthrough : https://www.youtube.com/watch?v=IX4h5aaSK1g&t=2160s |
| Kerberos on Linux | SEKHMET | Dumping the sssd.ldb, 	Using kinit to get a kerberos ticket | Walkthrough : [https://youtube.com/watch?v=kKhuUXPmJ_o&t=3870](https://youtube.com/watch?v=vsgPsMZx59w&t=2400) |

</details>


<b><details><summary>15. Microsoft SQL Server </summary></b>

| Attack Type | HTB Machine | Attack Used in HTB | Link |
|:---:|:---:|:---:|:---:|
| MS SQL in AD | ESCAPE | Using mssqlclient to login to access MSSQL | Walkthrough: https://youtube.com/watch?v=PS2duvVcjws&t=390|
| MS SQL Escalation | SCRAMBLED | enabling xp_cmdshell and getting a reverse shell | Walkthrough: https://youtube.com/watch?v=_8FE3JZIPfo&t=1000 |
| MS SQL Escalation | STREAMIO | Using xp_dirtree to make the MSSQL database connect back to us and steal the hash | Walkthrough: [https://youtube.com/watch?v=_8FE3JZIPfo&t=1000](https://youtube.com/watch?v=qKcUKlwoGw8&t=1335) |
</details>


<b><details><summary>16. Active Directory Exploitation </summary></b>

| Attack Type | HTB Machine | Attack Used in HTB | Link |
|:---:|:---:|:---:|:---:|
| AD Object permission theory | REEL | Explaining Active Directory (AD) Security Objects (GenericWrite, WriteOwner,etc) | walkthrough: https://youtube.com/watch?v=ob9SgtFm6_g&t=3205 |
| Abusing GenericAll | SUPPORT | Abusing GenericAll object permission | walkthrough: https://youtube.com/watch?v=iIveZ-raTTQ&t=970 |
| Abusing GenericAll, WriteDACL | MULTIMASTER | Abusing GenericAll, WriteDACL | Walkthrough: https://youtube.com/watch?v=iwR746pfTEc&t=7410 |
| Abusing GenericWrite, WriteDACL | REEL | Taking ownership and changing other user's password | Walkthrough: https://youtube.com/watch?v=ob9SgtFm6_g&t=3503|
| Kerberos Delegation | PivotAPI | Unconstrained delegation with the SQL User. Upload rubeus, use tgtdeleg | Walkthrough: https://youtube.com/watch?v=FbTxPz_GA4o&t=7215 |
| Kerberos Delegation | INTELLIGENCE | Unconstrained delegation | Walkthrough: https://secnigma.wordpress.com/2021/11/27/hack-the-box-intelligence/ |
| Kerberos Delegation | SUPPORT | RBCD | walkthrough: https://youtube.com/watch?v=iIveZ-raTTQ&t=970 <br> Post: https://pencer.io/ctf/ctf-htb-support/#rbcd |
</details>



<br>    
  
-----------------------------------------------------------------------------------------------
