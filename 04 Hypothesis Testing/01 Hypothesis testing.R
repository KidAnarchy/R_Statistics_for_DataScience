#----------------------------------------------------------
#         Hypothesis testing for a population mean
#---------------------------------------------------------

"""
-------------------Example 7---------------------------------
The concentration of mercury in a lake has been monitored for number
of years. Measurements taken a weekly basis yielded an average of 1.20
mg/m3(milligrams per cubic metre) with a standard deviation of 0.32
mg/m3. Follow an accident at a smelter on the shore of the lake, 15
measurements produced the following mercury concentrations.

1.6 1.77 1.61 1.08 1.07 1.79 1.34 1.07
1.45 1.59 1.43 2.07 1.16 0.85 2.11

Is there sufficient evidence that the average mercury concentration has
increased since the accident? Use level of significance 0.05.
"""

x = c(1.6, 1.77, 1.61, 1.08, 1.07, 1.79, 1.34, 1.07, 1.45, 1.59, 1.43, 2.07, 1.16, 0.85, 2.11)

# Mean
xbar = mean(x)
xbar

# Standard Deviation
s = sd(x)
s
mu = 1.2
n =length(x)
sigma= 0.32

# Test statistic
z_cal = (xbar - mu)/(sigma/sqrt(n))
z_cal