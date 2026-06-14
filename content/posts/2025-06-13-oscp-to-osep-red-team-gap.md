---
title: "From OSCP to OSEP: Does it Fill the Red Team Gap?"
date: 2025-06-13
lastmod: 2025-06-13
description: "What OSCP doesn't teach you and why it matters for real enterprise work. A practitioner's perspective on the gap between entry-level certification and red team readiness, written after passing OSCP in 2017 and OSEP while actively working in red teaming."
categories: [research, red-team]
tags: [oscp, osep, red-team, active-directory, career, penetration-testing, evasion]
author: z-r0crypt
featured: false
draft: false
summary: "The honest gap between OSCP and OSEP from someone who passed OSCP in 2017 and OSEP while actively working as a red teamer. What enterprise environments actually demand and why evasion changes everything."
---

## Background

I passed OSCP in 2017. At the time it was exactly what it was supposed to be — a foundation. You learn the hacker mindset, basic exploitation, and how to approach a problem systematically. That is genuinely valuable and I don't diminish it.

But a few years into professional penetration testing I took on a non-standard infrastructure assessment that required me to build test cases from scratch rather than follow a standard methodology. That exercise led me to MITRE ATT&CK, and MITRE ATT&CK showed me how much I didn't know.

The technique that stood out immediately was lateral movement. OSCP touches on it briefly. In a real enterprise environment, lateral movement is often the entire engagement. Getting initial access is the easy part. What you do after — how you move, how you stay hidden, how you chain systems together to reach your objective — that's where most assessments succeed or fail.

That realisation is what led me to OSEP.

---

## What OSCP Actually Is

OSCP is an entry-level certification and that's exactly how I thought about it when I registered in 2016. Its real value is the mindset it instills — methodical enumeration, understanding why exploits work, not giving up. Those fundamentals don't expire.

But OSCP was designed around a specific scenario: find a vulnerability in an isolated system and exploit it. Even with the 2023 syllabus additions, the mental model is still largely single-target. You find the CVE, you understand the exploit, you get a shell.

Enterprise environments don't work that way. In 99% of enterprise environments you are operating inside Active Directory from the moment you get initial access. The real question is never "can I exploit this one box" — it's "how do I move from this foothold to domain compromise without triggering detection."

OSCP, even the current version, does not prepare you for that question in any meaningful depth.

---

## The AD Gap

When I passed OSCP in 2017, Active Directory was barely mentioned. The course has evolved since then and the 2023 version includes basic AD attacks — Kerberoasting, AS-REP roasting, basic BloodHound usage. That is a genuine improvement.

But basic AD knowledge and red team AD capability are very different things. A current OSCP holder might be able to run BloodHound and identify a path to domain admin in a lab environment. What they will not know is how to do any of that while evading a modern EDR, how to operate through a C2 framework with proper OPSEC, or how to chain together a multi-hop attack across network segments with different trust boundaries.

The depth of real enterprise environments is what OSCP cannot simulate. In a real engagement you are not dealing with a flat network with retired HTB-style machines. You are dealing with segmented networks, mature logging, endpoint detection, and blue teams that are actively looking for you.

---

## What OSEP Actually Teaches

When I sat OSEP I was already working in red teaming. I didn't need to go through the course material heavily to pass the exam — the techniques were familiar from real engagements. But that's the point: OSEP teaches what red teamers actually do.

The course covers things OSCP never touches:

**Antivirus and EDR evasion** — this is the biggest gap. In any real enterprise engagement, you will face endpoint protection. Running a standard Meterpreter payload or a public exploit directly will get you caught immediately. OSEP teaches you to think about signatures, behaviour-based detection, and how to build or modify tooling to operate under the radar. This is not optional in red teaming — it is the baseline.

**Process injection and migration** — operating inside legitimate processes rather than your own malicious one is fundamental to staying hidden. OSCP doesn't cover this. OSEP does it properly.

**Client-side attacks** — phishing, malicious documents, Windows Script Host abuse. Most real initial access in enterprise environments comes through people, not through exposed services. OSEP covers this attack surface seriously.

**C2 framework operation** — operating through a proper command and control framework with real OPSEC considerations is a different skill from running individual tools. OSEP gives you the foundation for this thinking even if it doesn't cover every framework.

**Multi-hop lateral movement** — moving through network segments, pivoting through compromised systems, operating in environments where your tools can't reach the internet directly. This is where real engagements get complicated and where OSEP genuinely prepares you.

---

## OSEP Won't Prepare You for Everything Either

Every red team engagement comes with a different set of challenges. Custom environments, unusual configurations, mature blue teams with specific detection capabilities — no certification can simulate all of that.

What OSEP gives you is the mindset to approach those challenges. After completing the coursework seriously, you have a framework for thinking about detection, evasion, and lateral movement that transfers across different environments. You know what questions to ask, what to look for, and how to adapt when your standard approach doesn't work.

That adaptability is what separates a red teamer from a script runner. OSCP starts building it. OSEP develops it seriously.

---

## The Evasion Gap is the Real Gap

If I had to name one thing that makes OSEP essential for anyone moving into red teaming, it is evasion.

A current OSCP holder can likely conduct a reasonable penetration test against an organisation without mature security controls. They can find vulnerabilities, exploit them, and document findings.

Put that same person against an enterprise with a modern EDR, a SIEM, and an active SOC, and their public tools will get caught, their payloads will get blocked, and their activity will get detected. They will not know why, and they will not know how to adapt.

OSEP teaches you why detection happens and how to think around it. That knowledge doesn't go stale the way specific techniques do, because the underlying principles — understanding signatures, understanding behaviour-based detection, understanding what normal looks like so you can blend into it — remain relevant regardless of which specific tools or evasion techniques are current.

---

## Who Should Do OSEP

If you are working in penetration testing and want to move into red teaming, OSEP is the right next step after OSCP. Not immediately — spend time doing real assessments first, get comfortable with AD environments, learn to use BloodHound properly, understand how enterprise networks are actually structured.

Then do OSEP. Do the coursework properly even if you have experience, because the course is dense and the challenge labs are the closest thing to a real multi-machine engagement you will find in a certification context.

If you passed OSCP recently and feel ready for OSEP immediately — you probably aren't. Go work on real environments, find your gaps, then come back. OSEP is more valuable when you already have the context to understand why the techniques matter.

---

## Resources

- [OSEP/PEN-300 HTB preparation list](/posts/2023-04-27-htb-osep-machines/) — machines mapped to every PEN-300 syllabus topic
- [MITRE ATT&CK](https://attack.mitre.org/) — the framework that showed me what I didn't know
- [OSWE/AWAE preparation](/posts/2020-01-22-oswe-awae-prep/) — if web application exploitation is your focus