# 3.What is the probability that 6 startups company generate a profit in the first year.
# Ans  P(X=6)
dbinom(6,10,0.8)




# 4. What is the probability that at least 4 startups company generate a profit in the first year.
# Ans  P(X>=4)=1-P(X<4)=1-P(X<=3)
1-pbinom(3,10,0.8)





# 5. What is the probability that 7 startups company do not generate a profit in the first year.

#Ans P(X=3)
dbinom(3,10,0.8)
# OR

# P(X=7)
dbinom(7,10,0.2)





# 6. Out of 10 startups company, what is the average of company that make a profit 
# from the first year. (Find the expected value of X)
#Ans
x = c(0:10)
x
Px = dbinom (x,10,0.8)
Px


Ex = sum(x*Px)
Ex





























