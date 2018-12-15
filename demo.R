########################################################################
# Introduce the concept SAR model for movie recommendations
#
# Original author: Fang Zhou
# Rewritten and Updated to MLHub Requirements: Graham Williams

nuser <- 2

cat("=================
Movie Recommender
=================

Below we demonstrate a typical recommendations scenario. The Movielens
dataset has been used to build a recommendation model using the SAR
algorithm. The model is applied to 10 users to suggest their next
movie to watch given their history. We show the recommendations for
two random users below.

")

# Load required packages.

suppressMessages(
{
library(caret)
library(plyr)
library(dplyr)
library(SAR)
})

load("sar_model.RData")

# load the demo data

data_dir <- "data"
dfu <- read.csv(file.path(data_dir, "ml-latest-small/user10.csv"), header = TRUE)
names(dfu) <- c("user", "item",  "rating", "time", "title", "genres")
dfu$time <- as.POSIXct(as.numeric(as.character(dfu$time)), origin="1970-01-01", tz="GMT")

# number of users.

nid <- dfu$user %>% unique() %>% length()

# prediction per user (user)

nrec <- 2
recu <- user_predict(loc_count, userdata=dfu, n=nrec)

# evaluation

metrics <- user_pred_metrics(recu, dfu)

# more interpretable output

recu2 <- NULL
recu2$user <- rep(as.numeric(recu$user), each=nrec)
recu2$item <- as.vector(t(as.matrix(recu[, 2:(nrec+1)])))
recu2 <- as.data.frame(recu2)

cat("Press Enter to review the first recommendations: ")
invisible(readChar("stdin", 1))

map <- read.csv(file.path(data_dir, "/ml-latest-small/map.csv"), header = TRUE)
mapu <- join(map, recu2, by="item", type="right")
recu2$title <- mapu$title

for (i in sample(nid, nuser))
{
  cat("\n========\n")
  cat("User", sprintf("%03d", i))
  cat("\n========\n\n")

  wsmpl <- 5
  cat("Watched\n  * ")
  watched <- dfu$title[dfu$user==i] %>% sort()
  if (wsmpl <= length(watched))
    smpl <- sample(length(watched), wsmpl) %>% sort()
  else
    smpl <- 1:length(watched)
  as.character(watched[smpl]) %>% paste(collapse="\n  * ") %>% cat()
  cat("\n  * ...", length(watched)-wsmpl, "more ...")

  cat("\n\nRecommend\n  * ")
  recommend <- recu2$title[recu2$user==i]
  as.character(recommend[1:nrec]) %>% paste(collapse="\n  * ") %>% cat()
  cat("\n\nPress Enter to continue: ")
  invisible(readChar("stdin", 1))

}

# This was never implemented.
#cat("====================================\n")
#cat("Overall Model Performance Evaluation")
#cat("\n====================================\n")

#cat("\n UNDER DEVELOPMENT\n\n")
#cat("\nPrecision =", mean(metrics$prec), "Proportion of top 5 recommendations suitable for user.",
#    "\nRecall    =", mean(metrics$rec),  "Proportion of good recommendations in top 5.\n\n")


cat("
Run the demo again to view recommendations for different users.
")
