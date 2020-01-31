---
layout: post
title:  "OSWE/AWAE Preparation"
date:   2020-01-22 22:10:36 -0500
categories:  [Web, Exploit]
tags: [OSWE, AWAE, Web, Offensive Security, Exploit]
---

## AWAE-Preparation
This post contains all trainings and tutorials that could be useful for offensive security's OSWE certification. I will be updating the post during my lab and preparation for the exam.

### Course Syllabus:
[https://www.offensive-security.com/documentation/awae-syllabus.pdf](https://www.offensive-security.com/documentation/awae-syllabus.pdf)

### Before registering for AWAE:
 
  * #### Cross-Site Scripting:
     * [XSS](https://portswigger.net/web-security/cross-site-scripting)
     * [XMLHttpRequest Specification](https://xhr.spec.whatwg.org/)
     * [AtMail Email Server Appliance 6.4 - Persistent Cross-Site Scripting](https://www.exploit-db.com/exploits/20009)
     * [Persistent XSS](https://www.acunetix.com/blog/articles/persistent-xss/)
     * [Hijack Session using socat](https://popped.io/hijacking-sessions-using-socat/)
     
  * #### XSS and MySQL
     * [PentesterLab: XSS and MySQL FILE](https://pentesterlab.com/exercises/xss_and_mysql_file/course)
       - [https://www.vulnhub.com/entry/pentester-lab-xss-and-mysql-file,66/](https://www.vulnhub.com/entry/pentester-lab-xss-and-mysql-file,66/)
  
  * #### Cross-Site Request Forgery
     * [CSRF Prevention Cheatsheet](https://cheatsheetseries.owasp.org/cheatsheets/Cross-Site_Request_Forgery_Prevention_Cheat_Sheet.html) 
  
   
* ### ATutor Authentication Bypass and RCE (2.2.1) CVE-2016-2555
  - [ATutor Install](https://sourceforge.net/projects/atutor/files/atutor_2_2_1/)
  - [https://www.exploit-db.com/exploits/39514](https://www.exploit-db.com/exploits/39514)
  - [https://srcincite.io/advisories/src-2016-0009/](https://srcincite.io/advisories/src-2016-0009/)
  - [https://www.exploit-db.com/exploits/39639](https://www.exploit-db.com/exploits/39639)
  - [https://github.com/atutor/ATutor/commit/d74f1177cfa92ed8e49aa65f724f308b4a3ac5b9](https://github.com/atutor/ATutor/commit/d74f1177cfa92ed8e49aa65f724f308b4a3ac5b9)

* ### Bypassing File Upload Restrictions:
  - [https://www.exploit-db.com/docs/english/45074-file-upload-restrictions-bypass.pdf](https://www.exploit-db.com/docs/english/45074-file-upload-restrictions-bypass.pdf)
  - [http://www.securityidiots.com/Web-Pentest/hacking-website-by-shell-uploading.html](http://www.securityidiots.com/Web-Pentest/hacking-website-by-shell-uploading.html)
  - [https://www.owasp.org/index.php/Unrestricted_File_Upload](https://www.owasp.org/index.php/Unrestricted_File_Upload)
  - Popcorn machine from HackTheBox
  - Vault machine from HackTheBox

* ### PHP Type Juggling:
   * [https://shieldfy.io/security-wiki/php-vulnerabilities/exploitable-php-functions](https://shieldfy.io/security-wiki/php-vulnerabilities/exploitable-php-functions)
   * [https://www.owasp.org/images/6/6b/PHPMagicTricks-TypeJuggling.pdf](https://www.owasp.org/images/6/6b/PHPMagicTricks-TypeJuggling.pdf )
   * [https://medium.com/@Q2hpY2tlblB3bnk/php-type-juggling-c34a10630b10](https://medium.com/@Q2hpY2tlblB3bnk/php-type-juggling-c34a10630b10) 
   * [https://foxglovesecurity.com/2017/02/07/type-juggling-and-php-object-injection-and-sqli-oh-my/](https://foxglovesecurity.com/2017/02/07/type-juggling-and-php-object-injection-and-sqli-oh-my/)
   * [https://www.netsparker.com/blog/web-security/php-type-juggling-vulnerabilities/](https://www.netsparker.com/blog/web-security/php-type-juggling-vulnerabilities/)
   * [http://turbochaos.blogspot.com/2013/08/exploiting-exotic-bugs-php-type-juggling.html](http://turbochaos.blogspot.com/2013/08/exploiting-exotic-bugs-php-type-juggling.html)
   * [https://www.netsparker.com/blog/web-security/type-juggling-authentication-bypass-cms-made-simple/](https://www.netsparker.com/blog/web-security/type-juggling-authentication-bypass-cms-made-simple/)
   * [https://www.php.net/manual/en/types.comparisons.php](https://www.php.net/manual/en/types.comparisons.php)
   * [https://github.com/spaze/hashes](https://github.com/spaze/hashes)
   * [https://www.whitehatsec.com/blog/magic-hashes/](https://www.whitehatsec.com/blog/magic-hashes/)
   * [https://blog.ripstech.com/2018/cubecart-admin-authentication-bypass/](https://blog.ripstech.com/2018/cubecart-admin-authentication-bypass/)
   * Falafel machine from HackTheBox
   * [https://srcincite.io/advisories/src-2016-0012/](https://srcincite.io/advisories/src-2016-0012/)
   * [https://github.com/sourceincite/poc/blob/master/SRC-2016-0012.py](https://github.com/sourceincite/poc/blob/master/SRC-2016-0012.py)
   * [https://github.com/atutor/ATutor/commit/2eed42a74454355eddc7fc119e67af40dba1a94c](https://github.com/atutor/ATutor/commit/2eed42a74454355eddc7fc119e67af40dba1a94c)
   * Reference: PHP Type Juggling
      - [https://www.youtube.com/watch?v=ASYuK01H3Po](https://www.youtube.com/watch?v=ASYuK01H3Po)

* ### Deserialization:
   * [https://cheatsheetseries.owasp.org/cheatsheets/Deserialization_Cheat_Sheet.html](https://cheatsheetseries.owasp.org/cheatsheets/Deserialization_Cheat_Sheet.html)
   * [https://www.blackhat.com/docs/us-17/thursday/us-17-Munoz-Friday-The-13th-Json-Attacks.pdf](https://www.blackhat.com/docs/us-17/thursday/us-17-Munoz-Friday-The-13th-Json-Attacks.pdf)
   * [https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Deserialization_Cheat_Sheet.md](https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Deserialization_Cheat_Sheet.md)
   * [https://2017.zeronights.org/wp-content/uploads/materials/ZN17_Aleksei%20Tiurin_Deserialization%20vulnerabilities.pdf](https://2017.zeronights.org/wp-content/uploads/materials/ZN17_Aleksei%20Tiurin_Deserialization%20vulnerabilities.pdf)
   * [https://www.exploit-db.com/docs/english/44756-deserialization-vulnerability.pdf](https://www.exploit-db.com/docs/english/44756-deserialization-vulnerability.pdf)
   * [https://www.blackhat.com/docs/us-17/thursday/us-17-Munoz-Friday-The-13th-Json-Attacks.pdf](https://www.blackhat.com/docs/us-17/thursday/us-17-Munoz-Friday-The-13th-Json-Attacks.pdf)
   * [https://www.n00py.io/2017/11/exploiting-blind-java-deserialization-with-burp-and-ysoserial/](https://www.n00py.io/2017/11/exploiting-blind-java-deserialization-with-burp-and-ysoserial/)
   * [https://www.owasp.org/images/7/71/GOD16-Deserialization.pdf](https://www.owasp.org/images/7/71/GOD16-Deserialization.pdf)
   * [https://github.com/frohoff/ysoserial](https://github.com/frohoff/ysoserial) 
   * [https://github.com/GrrrDog/Java-Deserialization-Cheat-Sheet/blob/master/README.md](https://github.com/GrrrDog/Java-Deserialization-Cheat-Sheet/blob/master/README.md)
   * [https://diablohorn.com/2017/09/09/understanding-practicing-java-deserialization-exploits/](https://diablohorn.com/2017/09/09/understanding-practicing-java-deserialization-exploits/)

* ### .NET Deserialization:
   - [DotNetNuke Install](https://github.com/dnnsoftware/Dnn.Platform/releases/tag/v9.1.0)
   - [https://media.blackhat.com/bh-us-12/Briefings/Forshaw/BH_US_12_Forshaw_Are_You_My_Type_WP.pdf](https://media.blackhat.com/bh-us-12/Briefings/Forshaw/BH_US_12_Forshaw_Are_You_My_Type_WP.pdf)
   - [https://github.com/pwntester/ysoserial.net](https://github.com/pwntester/ysoserial.net)
   - [https://github.com/0xd4d/dnSpy](https://github.com/0xd4d/dnSpy)
   - [https://www.blackhat.com/docs/us-17/thursday/us-17-Munoz-Friday-The-13th-Json-Attacks.pdf](https://www.blackhat.com/docs/us-17/thursday/us-17-Munoz-Friday-The-13th-Json-Attacks.pdf)
   - [https://gist.github.com/pwntester/72f76441901c91b25ee7922df5a8a9e4](https://gist.github.com/pwntester/72f76441901c91b25ee7922df5a8a9e4)
   - [https://paper.seebug.org/365/](https://paper.seebug.org/365/)
   - [https://www.youtube.com/watch?v=oUAeWhW5b8c](https://www.youtube.com/watch?v=oUAeWhW5b8c)
   - [https://vulners.com/seebug/SSV:96326](https://vulners.com/seebug/SSV:96326)
   - [https://www.slideshare.net/MSbluehat/dangerous-contents-securing-net-deserialization](https://www.slideshare.net/MSbluehat/dangerous-contents-securing-net-deserialization)
   - [https://www.exploit-db.com/docs/english/44756-deserialization-vulnerability.pdf](https://www.exploit-db.com/docs/english/44756-deserialization-vulnerability.pdf)

* ### JavaScript Injection:
   * [https://ckarande.gitbooks.io/owasp-nodegoat-tutorial/content/tutorial/a1-server-side-js-injection.html](https://ckarande.gitbooks.io/owasp-nodegoat-tutorial/content/tutorial/a1_-_server_side_js_injection.html)
   * [https://capacitorset.github.io/mathjs/](https://capacitorset.github.io/mathjs/)
   * [https://itnext.io/how-i-exploited-a-remote-code-execution-vulnerability-in-fast-redact-9e69fa35572f](https://itnext.io/how-i-exploited-a-remote-code-execution-vulnerability-in-fast-redact-9e69fa35572f)
   * [https://rhinosecuritylabs.com/application-security/nvidia-rce-cve-2019-5678/](https://rhinosecuritylabs.com/application-security/nvidia-rce-cve-2019-5678/)
   * [https://idiallo.com/javascript/settimeout-and-setinterval-and-setevil](https://idiallo.com/javascript/settimeout-and-setinterval-and-setevil)

* ### NodeJS:
   - **Bassmaster Install: npm install bassmaster@1.5.1**
   - [https://www.npmjs.com/package/bassmaster](https://www.npmjs.com/package/bassmaster)
   - [https://www.rapid7.com/db/modules/exploit/multi/http/bassmaster_js_injection](https://www.rapid7.com/db/modules/exploit/multi/http/bassmaster_js_injection)
   - [https://github.com/rapid7/metasploit-framework/blob/master/modules/exploits/multi/http/bassmaster_js_injection.rb](https://github.com/rapid7/metasploit-framework/blob/master/modules/exploits/multi/http/bassmaster_js_injection.rb)
   - [https://www.exploit-db.com/exploits/40689](https://www.exploit-db.com/exploits/40689)
   - [https://vulners.com/nodejs/NODEJS:337](https://vulners.com/nodejs/NODEJS:337)
   - [https://www.websecgeeks.com/2017/04/pentesting-nodejs-application-nodejs.html](https://www.websecgeeks.com/2017/04/pentesting-nodejs-application-nodejs.html)
   - [https://capacitorset.github.io/mathjs/](https://capacitorset.github.io/mathjs/)
   - [https://maikthulhu.github.io/2019-05-17-remote-debugging-node-vscode/](https://maikthulhu.github.io/2019-05-17-remote-debugging-node-vscode/)
   - [https://github.com/ajinabraham/Node.Js-Security-Course](https://github.com/ajinabraham/Node.Js-Security-Course)
   - [https://www.acunetix.com/blog/web-security-zone/deserialization-vulnerabilities-attacking-deserialization-in-js/](https://www.acunetix.com/blog/web-security-zone/deserialization-vulnerabilities-attacking-deserialization-in-js/)
   - [https://www.yeahhub.com/nodejs-deserialization-attack-detailed-tutorial-2018/](https://www.yeahhub.com/nodejs-deserialization-attack-detailed-tutorial-2018/)
   - Celestial machine from HackTheBox
   - [https://medium.com/@nodepractices/were-under-attack-23-node-js-security-best-practices-e33c146cb87d](https://medium.com/@nodepractices/were-under-attack-23-node-js-security-best-practices-e33c146cb87d)
   - [https://blog.netspi.com/escape-nodejs-sandboxes/](https://blog.netspi.com/escape-nodejs-sandboxes/)

* ### SQL Injection:
   - [Manage Engine Application Manager Install](http://archives.manageengine.com/applications_manager/12900)
   - [https://manageenginesales.co.uk/2018/05/manageengine-applications-manager-build-13730-released/](https://manageenginesales.co.uk/2018/05/manageengine-applications-manager-build-13730-released/)
   - [https://www.postgresql.org/docs/9.4/functions-binarystring.html](https://www.postgresql.org/docs/9.4/functions-binarystring.html)
   - [https://www.mulesoft.com/tcat/tomcat-jsp](https://www.mulesoft.com/tcat/tomcat-jsp)
   - [https://blog.jamesotten.com/post/applications-manager-rce/](https://blog.jamesotten.com/post/applications-manager-rce/)
   - [https://blog.ripstech.com/2019/oxid-esales-shop-software/](https://blog.ripstech.com/2019/oxid-esales-shop-software/)
   - [https://pentesterlab.com/exercises/from_sqli_to_shell/course](https://pentesterlab.com/exercises/from_sqli_to_shell/course)
   - [https://www.acunetix.com/websitesecurity/blind-sql-injection/](https://www.acunetix.com/websitesecurity/blind-sql-injection/)
   - **PostgreSQL**
       + [http://pentestmonkey.net/cheat-sheet/sql-injection/postgres-sql-injection-cheat-sheet](http://pentestmonkey.net/cheat-sheet/sql-injection/postgres-sql-injection-cheat-sheet)
       + [http://www.leidecker.info/pgshell/Having_Fun_With_PostgreSQL.txt](http://www.leidecker.info/pgshell/Having_Fun_With_PostgreSQL.txt)
       + [https://www.exploit-db.com/papers/13084](https://www.exploit-db.com/papers/13084)
       + [http://www.postgresqltutorial.com/postgresql-string-functions/](http://www.postgresqltutorial.com/postgresql-string-functions/) 
       + [https://www.linuxtopia.org/online_books/database_guides/Practical_PostgreSQL_database/c7547_002.htm](https://www.linuxtopia.org/online_books/database_guides/Practical_PostgreSQL_database/c7547_002.htm)
       + [https://www.infigo.hr/files/INFIGO-TD-2009-04_PostgreSQL_injection_ENG.pdf](https://www.infigo.hr/files/INFIGO-TD-2009-04_PostgreSQL_injection_ENG.pdf)
       + [https://dotcppfile.wordpress.com/2014/07/12/blind-postgresql-sql-injection-tutorial/](https://dotcppfile.wordpress.com/2014/07/12/blind-postgresql-sql-injection-tutorial/)

* ### XXE
    * [Open source app with XXE. Uses XXE + SSRF to achieve RCE](https://www.exploit-db.com/exploits/46693)
    * [CakePHP XXE](https://www.exploit-db.com/exploits/19863)
    * [Opensource app with XXE](https://www.exploit-db.com/exploits/41466)
    * [Grails PDF Plugin 0.6 - XML External Entity Injection](https://www.exploit-db.com/exploits/44607)
    * [XXE in ASP.NET app](https://www.exploit-db.com/exploits/46106)
    
* ### Youtube Playlist
    * [https://www.youtube.com/watch?v=Xfbu-pQ1tIc&list=PLwvifWoWyqwqkmJ3ieTG6uXUSuid95L33](https://www.youtube.com/watch?v=Xfbu-pQ1tIc&list=PLwvifWoWyqwqkmJ3ieTG6uXUSuid95L33)
    
* ### Further References/Reviews
    * [https://hansesecure.de/2019/08/from-awae-to-oswe-the-preperation-guide/?lang=en](https://hansesecure.de/2019/08/from-awae-to-oswe-the-preperation-guide/?lang=en)
    * [https://github.com/wetw0rk/AWAE-PREP](https://github.com/wetw0rk/AWAE-PREP)
    * [https://ldxf.botonia.it/rce-via-file-upload.html](https://ldxf.botonia.it/rce-via-file-upload.html)
    * [https://www.corben.io/atlassian-crowd-rce/](https://www.corben.io/atlassian-crowd-rce/)
    * [Use of Deserialization in .NET Framework Methods and Classes.](https://www.nccgroup.trust/globalassets/our-research/uk/images/whitepaper-new.pdf)  
    * [https://www.blackhat.com/docs/us-17/thursday/us-17-Munoz-Friday-The-13th-JSON-Attacks-wp.pdf](https://www.blackhat.com/docs/us-17/thursday/us-17-Munoz-Friday-The-13th-JSON-Attacks-wp.pdf)
    * [https://blog.ripstech.com/](https://blog.ripstech.com/)
    * [https://rhinosecuritylabs.com](https://rhinosecuritylabs.com)
    * [https://forum.hackthebox.eu/discussion/2646/oswe-exam-review-2020-notes-gifts-inside](https://forum.hackthebox.eu/discussion/2646/oswe-exam-review-2020-notes-gifts-inside)    
  
