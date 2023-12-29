# makefile for building the project with cooperative multithreading
SOURCE_DIR = ./src
BUILD_DIR = ./build

CC = sdcc
CFLAGS  = -c --std-sdcc99 --model-small
LDFLAGS =

# Define the object files needed for the final executable
SOURCES = $(wildcard $(SOURCE_DIR)/*.c)
BASENAME = $(SOURCES:$(SOURCE_DIR)/%.c=%)
BASEDIRS = $(BASENAME:%=$(BUILD_DIR)/%)
OBJ_FILES = $(foreach base,$(BASENAME),$(BUILD_DIR)/$(base)/$(base).rel)


# Default target for when you just run `make`
all: |dir $(BASENAME) dino.hex
dir: $(BUILD_DIR) $(BASEDIRS)
test:
	echo $(BASENAME)

$(BUILD_DIR):
	mkdir "$@"

$(BASEDIRS):
	mkdir "$@"

$(BASENAME): % : $(SOURCE_DIR)/%.c
	$(CC) $(CFLAGS) -o $(BUILD_DIR)/$@/$@.rel $<

# Rule for creating the final executable
dino.hex: $(OBJ_FILES)
	$(CC) $(LDFLAGS) -o $(BUILD_DIR)/dino.hex $^