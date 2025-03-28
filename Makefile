IMAGE_NAME=ghidra-bbextract
GCC_BIN=riscv32-linux-gnu-gcc

.PHONY: build shell example

build:
	docker build -t $(IMAGE_NAME) .

shell:
	docker run -it --rm --entrypoint="" $(IMAGE_NAME) bash

example:
	clang -g -O0 --target=riscv32 -march=rv32gc -c example/switch.c -o example/switch.riscv32.clang.O0
	$(GCC_BIN) -g -O0 -c example/switch.c -o example/switch.riscv64.gcc.O0
	clang -g -O0 -c example/switch.c -o example/switch.x86.clang.O0

