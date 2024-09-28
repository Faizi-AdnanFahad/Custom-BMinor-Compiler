# Makefile
# 2024-09-22
# Lab 1 Makefile modified group 10s directory structure

# The generale rule of thumb is to compile the scanner.flex file to get scanner.c, \
then compile all of the .c files to their respective .o files and link them all to \
get a bminor executable


DIST=bin
SRC=src
OBJ_FILES=$(addprefix $(DIST)/, \
	 main.o \
	 scanner.o \
	 helper.o \
	 constants.o)

INC=include

# build bminor executable using the OBJECT_FILES defined.
$(DIST)/bminor: $(OBJ_FILES)
	gcc $^ -o $(DIST)/bminor

# pattern to compile any .c file to its corresponding .o file with any .h dependency.
$(DIST)/%.o: $(SRC)/%.c $(INC)/*.h
	gcc -Wall -g -c $< -o $@

# Generate scanner.c from scanner.flex
$(SRC)/scanner.c: $(SRC)/scanner.flex
	flex -o $(SRC)/scanner.c $(SRC)/scanner.flex

# Delete all temporary files for program to be built from scratch
clean:
	rm -f $(SRC)/scanner.c $(DIST)/*.o bminor tests/scanner/*.bminor.out

# Test suite
# lexer tests
test-scanner:
	cd tests/scanner && ./run_all_tests.sh