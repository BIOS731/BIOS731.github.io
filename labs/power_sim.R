####################################################################
# BIOS 731: Advanced Statistical Computing
#
# power_sim.R
#
# Estimates the power of a two-sample t-test via simulation
# across a grid of sample sizes.
#
# Runs ONE scenario at a time.
# - Locally: scenario is hard-coded to 1 (for testing)
# - On the cluster: scenario is passed as a command-line argument
####################################################################

suppressPackageStartupMessages(library(tidyverse))

wd <- getwd()

if (substring(wd, 2, 6) == "Users") {
  doLocal <- TRUE
} else {
  doLocal <- FALSE
}

###############################################################
## define simulation parameters
###############################################################

nsim  <- 1000        # number of simulated datasets per scenario
delta <- 0.5         # true standardized effect size (mean difference / SD)
sigma <- 1           # within-group standard deviation
alpha <- 0.05        # significance level for each test

# grid of sample sizes (per group) to evaluate
n_vec <- c(25, 50, 100, 200)

###############################################################
## select scenario
###############################################################

if (doLocal) {
  scenario <- 1
} else {
  scenario <- as.numeric(commandArgs(trailingOnly = TRUE))
}

n <- n_vec[scenario]

###############################################################
## run simulation
###############################################################

set.seed(scenario * 42)
reject <- logical(nsim)

for (i in seq_len(nsim)) {
  group1    <- rnorm(n, mean = 0,     sd = sigma)
  group2    <- rnorm(n, mean = delta,  sd = sigma)
  reject[i] <- t.test(group1, group2)$p.value < alpha
}

###############################################################
## save results
###############################################################

results <- tibble(
  n        = n,
  delta    = delta,
  alpha    = alpha,
  power    = mean(reject),
  scenario = scenario
)

Date <- gsub("-", "", Sys.Date())
dir.create(file.path(here::here("results"), Date), recursive = TRUE, showWarnings = FALSE)

filename <- file.path(here::here("results", Date), paste0(scenario, ".RDA"))
save(results, file = filename)

message("Scenario ", scenario, ": n = ", n,
        " | estimated power = ", round(mean(reject), 3))
