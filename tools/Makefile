.PHONY: all clean

CC := gcc
CFLAGS := -O3 -flto -std=c11 -Wall -Wextra -pedantic

tools := \
	gbcpal \
	gfx \
	lzcomp \
	png_dimensions \
	pokemon_animation \
	pokemon_animation_graphics \
	scan_includes

all: $(tools)
	@:

clean:
	$(RM) $(tools)

lzcomp: CFLAGS += -Wno-strict-overflow -Wno-sign-compare
lzcomp: $(wildcard lz/*.c) $(wildcard lz/*.h)
	$(CC) $(CFLAGS) -o $@ lz/*.c

%: %.c common.h
	$(CC) $(CFLAGS) -o $@ $<
