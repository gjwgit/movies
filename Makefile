########################################################################
#
# Makefile for movie-recommender-r pre-built ML model
#
########################################################################

# List the files to be included in the .mlm package.

MODEL_FILES = 				\
	train.R				\
	configure.R			\
	demo.R 				\
	print.R				\
	score.R				\
	README.txt			\
	DESCRIPTION.yaml		\
        movie-recommender.R 		\
        SAR_0.0.1.tar.gz		\
	sar_model.RData			\
	data.R  			\
	data/ml-latest-small/user10.csv	\
	data/ml-latest-small/map.csv	\

# Include standard Makefile templates.

include ../git.mk
include ../pandoc.mk
include ../mlhub.mk

clean::
	rm -rf README.txt output

realclean:: clean
	rm -f 	$(MODEL)_*.mlm

