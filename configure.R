cat("\n*** We also need to install this local package versions...\n")

pkgs <- c("SAR_0.0.1.tar.gz")
for (pkg in pkgs)
{
  cat("", basename(pkg), "\n")
  install.packages(pkg, repos=NULL, lib=lib)
}
