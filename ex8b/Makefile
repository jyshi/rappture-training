# simple makefile for a Rappture-based program

CC		= gcc
CFLAGS		= -g -Wall

RAPPTURE_DIR	= /apps/share64/debian7/rappture/current
INCLUDES	= -I$(RAPPTURE_DIR)/include
LIBS		= -L$(RAPPTURE_DIR)/lib -lrappture -lm


all: mainc

mainc: main.c
	$(CC) $(CFLAGS) $(INCLUDES) $< -o $@ $(LIBS)

install:

clean:
	$(RM) mainc run*.xml
