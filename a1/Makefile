# Makefile
# 2024-09-22
# Lab 1 Makefile modified group 10s directory structure

DIST=bin
SRC=src
OBJ_FILES=$(addprefix $(DIST)/, \
	 main.o \
	 scanner.o \
	 helper.o \
	 constants.o \
	 messages.o)

INC=include

$(DIST)/bminor: $(OBJ_FILES)
	gcc -I$(INC) $^ -o $(DIST)/bminor

$(DIST)/%.o: $(SRC)/%.c $(INC)/*.h
	gcc -I$(INC) -Wall -g -c $< -o $@

$(SRC)/scanner.c: $(SRC)/scanner.flex
	flex -o $(SRC)/scanner.c $(SRC)/scanner.flex

clean:
	rm -f $(SRC)/scanner.c $(DIST)/*.o bminor
