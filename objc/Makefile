# Makefile for Fibonacci Objective-C

CC = clang
CFLAGS = -framework Foundation -fobjc-arc
TARGET = fibonacci
SOURCE = fibonacci.m

all: $(TARGET)

$(TARGET): $(SOURCE)
	$(CC) $(CFLAGS) -o $(TARGET) $(SOURCE)

clean:
	rm -f $(TARGET)

run: $(TARGET)
	./$(TARGET)

.PHONY: all clean run

