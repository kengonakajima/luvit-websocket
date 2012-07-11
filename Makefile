LUVIT = luvit
CFLAGS   := $(shell $(LUVIT) --cflags | sed s/-Werror//)
LIBFLAGS  := $(shell $(LUVIT) --libs )

all: build/hybi10.luvit

build/hybi10.luvit: src/hybi10.c
	mkdir -p build
	gcc $(LIBFLAGS) -g $(CFLAGS) -Isrc -o $@ $^

test:
	checkit tests/10.lua tests/76.lua

clean:
	rm -fr build

.PHONY: all clean test

