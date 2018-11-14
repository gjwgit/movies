# Install and configure Ubuntu system dependencies for the pre-built model.
#
# We choose to install user local packages using install-packages()
# rather than OS supplied packages to minimise the need for sys admin
# access from within mlhub. R itself is often operating system
# installed though not necessarily.

# Identify the required R packages for this model.

packages <- c("ggplot2", "dplyr", "caret", "plyr")

# Determine which packages need to be installed.

install  <- packages[!(packages %in% installed.packages()[,"Package"])]

# Report on what is already installed.

already <- setdiff(packages, install)
if (length(already))
{
    cat("The following required R packages are already installed:\n",
        paste(already, collapse=" "))
}

# Install into the package local R library.

lib <- file.path("./R")

# Ensure the library exists.

dir.create(lib, showWarnings=FALSE, recursive=TRUE)

# Install packages into the local R library.

if (length(install))
{
  cat(sprintf("Installing '%s' into '%s'...", paste(install, collapse="', '"), lib))
  install.packages(install, lib=lib)
}
cat("\n")

# Additional specific packages, often as an interim measure.

if (TRUE)
{
  cat("\nWe also need to install these specific package versions...\n")

  pkgs <- c("SAR_0.0.1.tar.gz")
  for (pkg in pkgs)
  {
    cat("", basename(pkg), "\n")
    install.packages(pkg, repos=NULL, lib=lib)
  }
}
