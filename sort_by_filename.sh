#!/bin/bash

################################################################################
# Sorts stdin by filename, just the filename, regardless of pathing.
#
# Arguments:
#   None
#
# Return value:
#   stdin sorted by filename (without mangling the input)
#
# Example:
#   find /some/root/dir | sort_by_filename
#
#   input of:
#     /some/root/dir/a/20-bar
#     /some/root/dir/a/90-world
#     /some/root/dir/z/f/e/a/10-foo
#     /some/root/dir/z/f/e/a/50-hello
#
#   would come out looking like:
#     /some/root/dir/z/f/e/a/10-foo
#     /some/root/dir/a/20-bar
#     /some/root/dir/z/f/e/a/50-hello
#     /some/root/dir/a/90-world
#
sort_by_filename() {
  sed "s/.*\/\([^\/]*\)/\1|\0/" | sort | cut -d'|' -f2
}
