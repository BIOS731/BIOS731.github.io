###################################################################################
# Julia Wrobel
#
# This file produces implements an EM algorithm for a two-part Gaussian MM
#####################################################################################



library(tidyverse)

data("faithful")

hist(faithful$waiting)

# things to define or the function
max_iterations = 100
tol = .0001

y = faithful$waiting
n = length(y)
iter = 0

## initialize parameter values
# choosing reasonable starting values based on the data
# what might be other good starting values?
mu1 = 55
mu2 =  80
sigma1 = 1
sigma2 = 1
lambda = 0.5


while(iter < max_iterations){


  ###############################################################
  ## E-step
  ###############################################################

  # compute current value of pi = E(z|y, theta)

  ###############################################################
  ## M-step
  ###############################################################

  mu1 = sum(pi * y)/sum(pi)
  mu2 = sum((1-pi)*y)/sum(1-pi)

  sigma1 = sum(pi * (y - mu1)^2)/sum(pi)
  sigma2 = sum((1-pi)*(y - mu2)^2)/sum(1-pi)

  lambda = sum(pi)/n
  ###############################################################


  ## define and store log likelihood at current iteration
  # set tolerance criteria
  iter = iter + 1

}


### return parameters of interest
# current estimates of z
# estimates of theta
# estimates of Q at each iteration
# estimates of l(theta|y) at each iteration
# estimates of

# plot likelood at each iteration
