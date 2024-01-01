# makefile for building the project with cooperative multithreading
SOURCE_DIR = ./src
BUILD_DIR = ./build

CC = sdcc
CFLAGS  = -c --opt-code-speed --model-small --no-xinit-opt
LDFLAGS =

# Define the object files needed for the final executable
DINO_MAIN = dino
TEST_MAIN = testlcd
SOURCES = $(wildcard $(SOURCE_DIR)/*.c)
BASENAME = $(SOURCES:$(SOURCE_DIR)/%.c=%)
BASEDIRS = $(BASENAME:%=$(BUILD_DIR)/%)
OBJ_FILES = $(foreach base,$(BASENAME),$(BUILD_DIR)/$(base)/$(base).rel)
OBJ_FILES := $(filter-out $(BUILD_DIR)/$(DINO_MAIN)/$(DINO_MAIN).rel,$(OBJ_FILES))
OBJ_FILES := $(filter-out $(BUILD_DIR)/$(TEST_MAIN)/$(TEST_MAIN).rel,$(OBJ_FILES))


# Default target for when you just run `make`
.PHONY: all din lcd dir test
all: lcd din
din: |dir $(BASENAME) dino.hex
lcd: |dir $(BASENAME) testlcd.hex
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
dino.hex: $(OBJ_FILES) $(BUILD_DIR)/$(DINO_MAIN)/$(DINO_MAIN).rel
	$(CC) $(LDFLAGS) -o $(BUILD_DIR)/dino.hex $^

testlcd.hex: $(OBJ_FILES) $(BUILD_DIR)/$(TEST_MAIN)/$(TEST_MAIN).rel
	$(CC) $(LDFLAGS) -o $(BUILD_DIR)/testlcd.hex $^