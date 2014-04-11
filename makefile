TARGET = evaluation
LIBS = -lm -ledit
CC = gcc
CFLAGS = -g -Wall -O -Wextra -Wundef -Wshadow -Wpointer-arith -Wstrict-prototypes -Wswitch-enum -Wconversion -Wunreachable-code -ftrapv -fverbose-asm -S -finstrument-functions

.PHONY: clean all default

default: $(TARGET)
all: default

OBJECTS = $(patsubst %.c, %.o, $(wildcard *.c))
HEADERS = $(wildcard *.h)

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

.PRECIOUS: $(TARGET) $(OBJECTS)

$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -Wall $(LIBS) -o $@

clean:
	-rm -f *.o
	-rm -f $(TARGET)
