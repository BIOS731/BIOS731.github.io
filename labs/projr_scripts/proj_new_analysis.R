####################################################################
# proj_new_analysis.R
#
# Creates a new R Markdown file in the analysis/ subdirectory.
# Similar in spirit to workflowr::wflow_open().
####################################################################

proj_new_analysis <- function(name, project_path = ".") {

  analysis_dir <- file.path(project_path, "analysis")

  if (!dir.exists(analysis_dir)) {
    stop("No 'analysis/' directory found. ",
         "Did you create this project with proj_start()?")
  }

  filename <- file.path(analysis_dir, paste0(name, ".Rmd"))

  if (file.exists(filename)) {
    stop("File '", filename, "' already exists.")
  }

  template <- c(
    "---",
    paste0('title: "', name, '"'),
    paste0('date: "', Sys.Date(), '"'),
    "output: html_document",
    "---",
    "",
    "```{r setup, include=FALSE}",
    "knitr::opts_chunk$set(echo = TRUE)",
    "```",
    "",
    "## Overview",
    ""
  )

  writeLines(template, filename)
  message("Created: ", normalizePath(filename))
  invisible(filename)
}
