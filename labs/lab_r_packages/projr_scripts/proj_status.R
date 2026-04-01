####################################################################
# proj_status.R
#
# Prints a summary of the files in each project subdirectory.
# Similar in spirit to workflowr::wflow_status().
####################################################################

proj_status <- function(project_path = ".") {

  dirs <- c("data", "R", "analysis", "results", "docs")

  cat("Project:", normalizePath(project_path), "\n\n")

  for (folder in dirs) {
    folder_path <- file.path(project_path, folder)

    if (!dir.exists(folder_path)) {
      cat(sprintf("  %-12s [missing]\n", paste0(folder, "/")))
      next
    }

    files <- list.files(folder_path)
    cat(sprintf("  %-12s %d file(s)\n", paste0(folder, "/"), length(files)))

    if (length(files) > 0) {
      cat(paste0("    - ", files, collapse = "\n"), "\n")
    }
  }

  invisible(NULL)
}
