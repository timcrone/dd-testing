#!/bin/sh
dd if=/dev/urandom | bzip2 -9 > /dev/null &
