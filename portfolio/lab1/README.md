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

----

* If you fork my repo, you should add my master repository to your upstream so that you can regularly pull and merge my updates. There's still a lot of files to be added! This [GitHub help file](https://help.github.com/articles/fork-a-repo) explains the procedure you would need to follow.


