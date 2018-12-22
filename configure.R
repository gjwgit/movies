# Install into the package local R library.

lib <- file.path("./R")

# Ensure the library exists.

dir.create(lib, showWarnings=FALSE, recursive=TRUE)

cat("\n*** We also need to install this local package versions...\n")

pkgs <- c("SAR_0.0.1.tar.gz")
for (pkg in pkgs)
{
  cat("", basename(pkg), "\n")
  install.packages(pkg, repos=NULL, lib=lib)
}
