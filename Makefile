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

INC_BASE    = $(HOME)/.local/share/make
INC_PANDOC  = $(INC_BASE)/pandoc.mk
INC_GIT     = $(INC_BASE)/git.mk
INC_MLHUB   = $(INC_BASE)/mlhub.mk
INC_CLEAN   = $(INC_BASE)/clean.mk

ifneq ("$(wildcard $(INC_PANDOC))","")
  include $(INC_PANDOC)
endif
ifneq ("$(wildcard $(INC_GIT))","")
  include $(INC_GIT)
endif
ifneq ("$(wildcard $(INC_MLHUB))","")
  include $(INC_MLHUB)
endif
ifneq ("$(wildcard $(INC_CLEAN))","")
  include $(INC_CLEAN)
endif




clean::
	rm -rf README.txt output

realclean:: clean
	rm -f 	$(MODEL)_*.mlm

