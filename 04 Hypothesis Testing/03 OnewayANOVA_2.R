#**************************One-way ANOVA**********************************
'''
-----------------------Example 2-----------------------------------------
Kenton Food Company wanted to compare four different package
designs (numbered 1, 2, 3, 4 in no particular order). The number of
designs sold in 20 stores, but one was destroyed by fire during the
study, so 19 observations.

Is there any different in the sales among the 4 designs?
'''
-------------------------------------------------------------------------
d1 = c(11,17,16,14,15)
d2 = c(12,10,15,19,11)
d3 = c(23,20,18,17)
d4 = c(27,33,22,26,28)

DataDesign <- data.frame(
  Sold=c(d1, d2, d3, d4),
  Design =factor(rep(c("d1", "d2", "d3", "d4"), 
                     times=c(length(d1), length(d2), length(d3), length(d4))))
)
DataDesign
View(DataDesign)

str(DataDesign)

fit_ex2 <- aov(Sold~Design, data=DataDesign)

anova(fit_ex2)

summary(fit_ex2)

#rejection region at alpha = 0.01
qf(0.99,3,15)
#rejection region at alpha = 0.05
qf(0.95,3,15)

#----------------------------------------------------------