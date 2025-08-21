CC=gcc
CFLAGS= -Wall
TARGET=calculator
SRC= digi_calculator.c
.PHONY: all say_hello run_program clean
all: say_hello run_program 
say_hello:
	@echo "this Makefile will run a simple calculator program"
run_program:$(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $(TARGET)
	@./$(TARGET)

clean:
	rm -f $(TARGET)
