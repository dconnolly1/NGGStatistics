# Exercise 1: Assume that there are 10 quanta available in a nerve terminal, 
# and for a given release event each is released with a probability of 0.2. For one such event,
# what is the probability that 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, or 10 quanta will be released?
quantprob <- function(p,n,k){
  prob = factorial(n)/(factorial(k)*factorial(n-k))*p^k*((1-p)^(n-k))
  return(prob)
}

for (i in 0:10) {
print(quantprob(.2,10,i))
}

 
# Exercise 2: Let's say you know that a given nerve terminal contains exactly 14 quanta available for release. 
# You have read in the literature that the release probability of these quanta is low, say 0.1. To assess whether 
# this value is reasonable, you run a simple experiment: activate the nerve and measure the number of quanta that 
# are released. The result is 8 quanta. What is the probability that you would get this result (8 quanta) if the 
# true probability of release really was 0.1? What about if the true release probability was much higher; say, 0.7? 
# What about for each decile of release probability (0.1, 0.2, ... 1.0)? Which value of release probability did you 
# determine to be the most probable, given your measurement?
quantprob(0.1,14,8)
quantprob(0.7,14,8)
for (i in (1:10)/10) {
  print(quantprob(i,14,8))
} #0.6 release probability gives the most probable outcome of 8 quanta

# #Exercise 3: Not feeling convinced by your single experiment (good scientist!), you repeat it under identical conditions. 
# This time you measure 5 quanta that were released. Your sample size has now doubled, to two measurements. You now want to
# take into account both measurements when you assess the likelihoods of different possible values of the underlying release
# probability. To do so, assume that the two measurements in this sample are independent of one another; that is, the value of 
# each result had no bearing on the other. In this case, the total likelihood is simply the product of the likelihoods associated 
# with each separate measurement. It is also typical to compute the logarithm of each likelihood and take their sum, which is 
# often more convenient (Links to an external site.). What are the values of the total likelihood and total log-likelihood in 
# this example, if we assume that the true release probability is 0.1?

quantprob(0.1,14,8)*quantprob(0.1,14,5)
log(quantprob(0.1,14,8))+log(quantprob(0.1,14,5))

# Of course, knowing those values of the likelihood and log-likelihood is not particularly useful until you can compare them to 
# the values computed for other possible values for the release probability, so you can determine which value of release 
# probability is most likely, given the data. Therefore, compute the full likelihood and log-likelihood functions using deciles 
# of release probability between 0 and 1. What is the maximum value? Can you improve your estimate by computing the functions at
# a higher resolution? How does the estimate improve as you increase the sample size?

for (i in (1:10)/10) {
  totalprob = quantprob(i,14,8)*quantprob(i,14,5)
  totalLogprob = log(quantprob(i,14,8))+log(quantprob(i,14,5))
  print(totalprob)
  print(totalLogprob)
} #0.5 probability gives the most probable outcome
#Increasing the number of simulations improves the estimate

