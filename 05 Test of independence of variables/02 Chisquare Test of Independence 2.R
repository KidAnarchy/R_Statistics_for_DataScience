#----------------------Example 3---------------------------------
'''
It has been reported that there is a relationship between gender and the
baby’s heart rate. A researcher wanted to find the evidence to
support/against this finding, so he collected the data as follows.

Test at the level of significance 0.01 to determine that the collected
data support or against the research finding.
'''

H = as.table(rbind(c(11, 7), c(17,5)))
dimnames(H) = list(Gender = c("Girl","Boy"),
                   HeartRate= c("Low","High"))
H

# Chisquare Test
test.chi3= chisq.test(H)
test.chi3$expected
test.chi3

# Fisher Test
test = fisher.test(H)
test
test$p.value

# Rejection Region
qchisq(0.99,1)
# P-Value
1-pchisq(0.58201,1)

#-----------------------------------------------------