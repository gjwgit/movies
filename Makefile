########################################################################
#
# Makefile for movie-recommender-r pre-built ML model
#
########################################################################

# List the files to be included in the .mlm package.

MODEL_FILES = 			\
	configure.R		\
	data.R  		\
        train.R			\
	print.R			\
        demo.R  		\
	score.R			\
        movie-recommender.R 	\
        SAR_0.0.1.tar.gz	\
	sar_model.RData		\
	README.txt		\
	DESCRIPTION.yaml 	\
	data

# Include the standard Makefile template.

include ../git.mk
include ../pandoc.mk
include ../mlhub.mk

clean::
	rm -rf README.txt output

realclean:: clean
	rm -rf movie-recommender*.mlm
