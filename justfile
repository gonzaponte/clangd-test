# -*-Makefile-*-

default:
  just build

build:
  meson setup build src
  meson compile -C build

install: build
  meson install -C build

run:
  @echo "Installing..."
  @just install >& /dev/null
  @install/helloworld/bin/helloworld

clean:
  rm build install -rf
