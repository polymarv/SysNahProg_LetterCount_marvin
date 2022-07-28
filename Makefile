#=============================================================================
#
# Makefile
#
#-----------------------------------------------------------------------------
#
# DHBW Ravensburg - Campus Friedrichshafen
#
# Vorlesung Systemnahe Programmierung
#
#=============================================================================

CC          = gcc
LD          = ld
NASM        = nasm
NASMOPT64   = -g -f elf64 -F dwarf
CFLAGS      = -Wall -g -std=gnu11 -O2
INCDIR      = .

TARGETS     = lettercount frac_test uint64_test

.PHONY: all
all: $(TARGETS)

lettercount: lettercount.o asciitable.o uint64_to_ascii.o frac_to_ascii.o
	$(LD) $(LDOPT64) -o $@ $^

lettercount.o : syscall.inc asciitable.inc

asciitable.o: asciitable.asm asciitable.inc
	$(NASM) $(NASMOPT64) -o $@ $<

frac_test : frac_test.o frac_to_ascii.o
	$(CC) $(CFLAGS) -o $@ $^

uint64_test : uint64_test.o uint64_to_ascii.o
	$(CC) $(CFLAGS) -o $@ $^

%.o : %.c
	$(CC) $(CFLAGS) -c -o $@ $<

%.o : %.asm
	$(NASM) $(NASMOPT64) -I$(INCDIR) -l $(basename $<).lst -o $@ $<

.PHONY: clean
clean:
	rm -f *.o *.lst $(TARGETS)

