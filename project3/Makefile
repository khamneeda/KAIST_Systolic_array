# Define the directory path variable
SRC_DIR := ./src
BUILD_DIR := ./build

$(shell mkdir -p $(BUILD_DIR))

c: $(SRC_DIR)/c_functions.c
	gcc -Ofast -shared -fPIC -o $(BUILD_DIR)/lib_c_functions.so $^

clean:
	rm -rf $(BUILD_DIR)

all: c