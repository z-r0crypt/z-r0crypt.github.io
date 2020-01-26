---
title:  "Microcorruption CTF - Tutorial"
date:   2019-11-25 22:10:36 -0500
categories:  
- CTF
- Reverse Engineering
tags: [Microcorruption, CTF, Reverse Engineering, Assembly, Exploit]
---


### Introduction

In this post I will share my learnings and research work done during microcorruption CTF challenge.

#### What is Microcorruption?

![](/images/micro-tut1.jpg)

It's an embedded security CTF challenge where you are given a debugger and a device (a smart lock), you will be given different levels of challenges to unlock the device, find flgs, find code vulnerabilitys, memory corruption bugs etc.

You'll use the debugger to reverse-engineer the code for each level. You can provide the device with input, then step through the code watching what the device does what that input. You're looking for a specific input that unlocks the device. Maybe that input is the correct passcode. More likely, though, it's something else: an input that exploits a bug in the device's code.

### Pre-requisites

* little knowledge of assembly
* little knowledge of debuggers
* knowledge of memory corruption vulnerabilities


To start with the CTF one is advised to go through the [lock manual](https://microcorruption.com/manual.pdf) provided by the CTF team. The manual provides of useful information from attackers perspective as well. The first thing you will get to know about the product `LockIT Pro` is that it is built on MSP430 microcontroller.

Lets dive into first level challenge. This level is more like a tutorial than a challenge and that is the reason it is called tutorial level.

### Level 0: CPUCTF Debugger Tutorial

This level is pretty much a walkthrough of the online debugger, assembly and the approach which should be used for further challenges. The level itself is the walkthrough of the first challenge which is to unlock the lockitPro lock so there is no point in explaining the solution in this post. Most of your time is spent on this level getting to know the web based debugger as well as general tips and tricks for moving around.


```
4484 <check_password>
4484:  6e4f           mov.b @r15, r14
4486:  1f53           inc   r15
4488:  1c53           inc   r12
448a:  0e93           tst   r14
448c:  fb23           jnz   #0x4484 <check_password+0x0>
448e:  3c90 0900      cmp   #0x9, r12   ; password length check
4492:  0224           jeq   #0x4498 <check_password+0x14>
```

Once we hit the first instruction in `check_password` at `0x4484`, the first character of the password you entered is loaded into `r14` from the memory location pointed to in `r15`. In next instructions, registers `r12` and `r15` are incremented. This will continue to iterate until a null byte `\0` is reached, bypassing the jump at `0x448c`, making the `cmp` be the next instruction.

If `r12` ends up being `0x09` (indicating that out passwords was 8 characters long followed by a null byte), then the jump at `0x4492` will occur, finally calling the interrupt to unlock the lock.

![](/images/micro-tut2.jpg)

The **solution** of this level is to provide any 8 character input as password.


