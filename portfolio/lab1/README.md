# Week 2: Lab 1: Elementary Signals

These examples have been adapted from Chapter 1 of 
[Stephen Karris, Signals and Systems : With MATLAB
Computing and Simulink Modeling (5th Edition)a](http://site.ebrary.com/lib/swansea/docDetail.action?docID=10547416)

## Keeping Lab Records

The lab component will be assessed based on a portfolio of the Matlab scripts, Simulink models and published Matlab sessions. You should therefore aim to keep all the files from each lab session in a suitable folder in your workspace on the h:\work drive. I would suggest a structure like **EG-247-Resources\portfolio\lab1** which matches the layout of the files on the GitHub repository.

One elegant way to do this would be to fork this GitHub repository ([cpjobling/EG-247-Resources](https://github.com/cpjobling/EG-247-Resources)) and then build on from there*, but that is not necessary. 

If you do not use GitHub as the master repository of your portfolio, please ensure that you backup your work files regularly. You will be required to submit some or all of them for assessment.

## Lab Exercise 1

In this exercise we will explore the use of the ``heaviside`` and ``dirac`` functions and how they can be used used in the sythesis of elementary signals.

File: [elem_sigs.m](https://github.com/cpjobling/EG-247-Resources/blob/master/portfolio/lab1/elem_sigs.m)

## Lab Exercise 2

Work through the procedures given between pages 1-18 and 1-19 of the text book to construct the piecewise signal generator first shown in Figure 1.21 inside Simulink. Connect the signal up a derivative block and scope as shown in Figure 1.24 and simulate the system. Verify the result illustrated in Figures 1.23, 1.25 and 1.26. Store the Simulink model as ``signal.slx`` in your portfolio for later assessment.

## What to Hand In

You should add your modified version of the file ``elem_signals.m`` in folder ``lab1`` of your EG-247 portfolio. Marks can be claimed according to how many of parts 1-5 in the script have been completed and for the Simulink model of the piecewise linear signal ``signal.slx``.

See [Assessment and Feedback: Labwork Assessment](https://docs.google.com/spreadsheet/ccc?key=0AljOJ7w63DbTdERaUkhYako2V3VEemdabnd6angxSEE&usp=sharing#gid=0) for a detailed marking scheme.

You will find it easiest to audit your completion of Exercise 1 by publishing the result using the **Publish** option in the m-file editor. I do not require you to add the published document in your portfolio as I will regenerate this when I validate your claim.


## Doing More

If you have time remaining, you may wish to work through Appendix A of the textbook. This chapters introduce Matlab in a way that matches the presentation in the rest of the book. There are also additional tutorial and video introductions to *Matlab*, *Simulink* and the *Signal Processing Toolbox* in the **Getting Started with Matlab** folder in the Labs section of the Blackboard site for EG-247.

----

* If you fork my repo, you should add my master repository to your upstream so that you can regularly pull and merge my updates. There's still a lot of files to be added! This [GitHub help file](https://help.github.com/articles/fork-a-repo) explains the procedure you would need to follow.


