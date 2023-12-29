# makefile for building the project with cooperative multithreading
BUILD_DIR = ./build

CC = sdcc
CFLAGS = --opt-code-speed -c --std-sdcc99 --model-small
LDFLAGS =

# Define the object files needed for the final executable
SOURCES = $(wildcard *.c)
BASENAME = $(SOURCES:%.c=%)
BASEDIRS = $(BASENAME:%=$(BUILD_DIR)/%)
OBJ_FILES = $(foreach base,$(BASENAME),$(BUILD_DIR)/$(base)/$(base).rel)


# Default target for when you just run `make`
all: $(BASENAME) dino.hex
dir: $(BUILD_DIR) $(BASEDIRS)
test:
	echo $(OBJ_FILES)

$(BUILD_DIR):
	mkdir "$@"

$(BASEDIRS):
	mkdir "$@"

$(BASENAME): % : %.c
	$(CC) $(CFLAGS) -o $(BUILD_DIR)/$@/$@.rel $<

# Rule for creating the final executable
dino.hex: $(OBJ_FILES)
	$(CC) $(LDFLAGS) -o $(BUILD_DIR)/dino.hex $^