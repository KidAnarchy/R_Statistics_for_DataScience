'''
-----------------------------Example 3---------------------------------
Three dye formulas for a certain synthetic fiber are under consideration
by a textile manufacturer who wishes to know whether the 3 are in fact
different in quality. An experiment was designed in which 5 specimens
of fabrics were cut into thirds, and one third was randomly assigned to
be dyed by each of the three dyes. Each piece of fabric is later graded
and assigned a score measuring the quality of the dye.

1. Identify the treatments/factor we want to compare
2. Carry out the test if there a difference between treatments 
at level of significance 0.05
'''

Fabric = factor(rep(1:5,each=3))
Dye = factor(rep(c("A","B","C"),times=5))
Score=c(74, 81, 95,78,86,99,76,90,90,82,93,87,77,73,93)

DataDye = data.frame(Fabric=Fabric,Dye,Score)

fit_ex3 = aov(Score~Dye+Fabric, data=DataDye) #Do not use Score~Fabric+Dye
summary(fit_ex3)

#---------------------------------------------------------------------