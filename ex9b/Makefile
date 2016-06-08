# simple makefile for a Rappture-based program

FC		= gfortran
FCFLAGS		= -g -Wall

RAPPTURE_DIR	= /apps/share64/debian7/rappture/current
INCLUDES	= -I$(RAPPTURE_DIR)/include
LIBS		= -L$(RAPPTURE_DIR)/lib -lrappture -lm


all: mainf77

mainf77: main.f
	$(FC) $(FCFLAGS) $(INCLUDES) $< -o $@ $(LIBS)

install:

clean:
	$(RM) mainf77 run*.xml
