################One-way ANOVA#####################################
'''
---------------------Example 1----------------------------------
A clinical trial is run to compare weight loss programs and participants are
randomly assigned to one of the comparison programs. Participants follow the
assigned program for 8 weeks. The outcome of interest is weight loss, defined
as the difference in weight measured at the start of the study (baseline) and
weight measured at the end of the study (8 weeks), measured in pounds.
Positive differences indicate weight losses and negative differences indicate
weight gains.

Is there a statistically significant difference in the mean weight loss among the
four diets? Use the level of significance 0.01.
'''
#-----------Method 1----------------------------
program = factor(rep(1:4,each=5))
weightloss = c(8,9,6,7,3,2,4,3,5,1,3,5,4,2,3,2,2,-1,0,3)

## Analyze data ####
fit1 = aov(weightloss ~ program)                 
summary(fit1)


#---------Method 2------------------------------
dataweight = read.csv("DataOnewayANOVA_Weightlossprogram.csv",
                      stringsAsFactors = TRUE,header = TRUE)
View(dataweight)
str(dataweight)

## Analyze data ####
fit2 = aov(weight ~ program, data=dataweight)                 
summary(fit2)

#----------------------------------------------