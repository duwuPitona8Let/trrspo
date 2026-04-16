CC = gcc
CFLAGS = -Wall -Wextra -O2
TARGET = processor
SRC = main.c

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -o $(TARGET) $(SRC)

clean:
	rm -f $(TARGET)

run: $(TARGET)
	./$(TARGET) "your mama dont likes me she likes every one"
