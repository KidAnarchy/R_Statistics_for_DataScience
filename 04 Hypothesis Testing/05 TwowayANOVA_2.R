'''
---------------------Example 4---------------------------------
Three different washing solutions are being compared to study their
effectiveness in retarding bacteria growth in 5-gallon milk containers.
The analysis is done in a laboratory, and only three trials can be run
on any day. Because days could represent a potential source of
variability, the experimenter decides to use a randomized block design.
The response is the percentage of bacteria remaining after rinsing the
container with a disinfecting solution. Observations are taken for four
days, and the data are shown here. Analyze the data from this
experiment and draw conclusions. Use the level of the significance 0.10.
'''

Solution = factor(rep(1:3,each=4))
Days = factor(rep(1:4,times=3))
Bact = c(13,22,18,39,16,24,17,44,5,4,1,2)

DataBact = data.frame(Solution,Days,Bact)

fit_ex4 = aov(Bact ~ Solution + Days)
summary(fit_ex4)

#-------------------------------------------------------------