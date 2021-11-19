#Example 2
'''
A researcher wanted to study if there is an association between stress
and marital status in adults. He asked 159 adults to do the stress tests
and determine the levels of their stress. The collected data are as
follows.

Use the Chi-square test to find if there is association between marital
status and level of stress in adults at level of significance 5%.
'''

#-----------------Method 1-------------------------------
freq = matrix(c(22,33,14,16,29,9,19,14,3),nrow = 3,ncol=3)
conTable = as.table(freq)
conTable
chisq.test(conTable)

#-----------------Method 2-------------------------------
M = as.table(rbind(c(22, 16, 19), c(33,29,14),c(14,9,3)))
dimnames(M) = list(Stress = c("Acute","Episodic","Chronic"),
                    Status = c("Married","Single","Divorced"))
test.chi= chisq.test(M)
test.chi

#To retrieve the expected frequencies
test.chi$expected

# ------------Fisher Test------------------------------
test.exct= fisher.test(M)
test.exct
test.exct$p.value

# Rejection Region
qchisq(0.95,4)
# P-Value
1-pchisq(6.8281,4)

#------------------------------------------------------