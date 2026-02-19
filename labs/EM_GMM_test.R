#####################################################################################
# Julia Wrobel
#
# This file produces implements an EM algorithm for a two-part Gaussian MM
#####################################################################################

library(tidyverse)

data("faithful")

y = faithful$waiting


## library mclust
library(mclust)

# Fit exactly 2 Gaussian

fit_mclust <- Mclust(y, G = 2)

summary(fit_mclust)

fit_mclust$parameters$mean
fit_mclust$parameters$variance



### mixtools does interface with bootstrap example
library(mixtools)


fit <- normalmixEM(y, k = 2)

# Parametric bootstrap
boot <- boot.se(fit, B = 500)

boot$se
boot$var
boot$ci
boot$mu.se
