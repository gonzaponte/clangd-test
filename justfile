# -*-Makefile-*-

# Needed to make `"$@"` usable in recipes
set positional-arguments := true

default:
  just build

build:
  meson setup build src
  meson compile -C build

install: build
  meson install -C build

run *ARGS:
  @echo "Installing..."
  @just install >& /dev/null
  @install/helloworld/bin/helloworld "$@"

clean:
  rm build install -rf
