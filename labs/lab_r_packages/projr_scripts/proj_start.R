####################################################################
# proj_start.R
#
# Creates a standardized project directory structure.
# Similar in spirit to workflowr::wflow_start().
####################################################################

proj_start <- function(name, path = ".") {

  project_path <- file.path(path, name)

  if (dir.exists(project_path)) {
    stop("Directory '", project_path, "' already exists.")
  }

  # create subdirectories
  for (folder in c("", "data", "R", "results", "analysis", "docs")) {
    dir.create(file.path(project_path, folder),
               recursive = TRUE, showWarnings = FALSE)
  }

  # write a minimal README
  writeLines(
    c(paste0("# ", name),
      "",
      paste0("Project created: ", Sys.Date())),
    file.path(project_path, "README.md")
  )

  message("Project '", name, "' created at ", normalizePath(project_path))
  invisible(project_path)
}
