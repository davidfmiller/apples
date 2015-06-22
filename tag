#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
Apply a Finder tag to a file from the command-line
"""

import sys
import os
import getopt
import tempfile
import subprocess

TAGS = ['none', 'orange', 'red', 'yellow', 'blue', 'purple', 'gray']

if __name__ != '__main__':
  sys.stderr.write("🚫  Incorrect usage\n")
  sys.exit(2)

try:
  opts, args = getopt.getopt(sys.argv[1:], 'v')
except getopt.GetoptError:
  sys.stderr.write("🚫  Incorrect usage\n")
  sys.exit(2)

if not args:
  args = []

verbose = False

for opt, arg in opts:
  if opt == '-v':
    verbose = True

tag = 0

if len(args) == 0:
  sys.stderr.write("🚫  No tag specified\n");
  sys.exit(2)

tag = args.pop(0);

# ensure tag passed in is valid
if (tag in TAGS):
  tag = TAGS.index(tag)
else:
  sys.stderr.write("🚫  Invalid tag: " + tag + "\n");
  sys.exit(2)

# use current directory if no file passed
if len(args) == 0:
  args.append('')

cmd = ''

# loop through all files
for arg in args:

  path = os.path.join(os.getcwd(), arg)

  if not os.path.exists(path):
    sys.stderr.write("📄  " + path + " does not exist\n")
    continue

  cmd += "  set f to POSIX file \"" + path + "\"\n  set filepath to f as alias\n  set label index of filepath to " + str(tag) + "\n"

if cmd:
  cmd = "tell application \"Finder\"\n" + cmd + "end tell\n" 
  f = tempfile.NamedTemporaryFile(delete=False)

  f.write(cmd)

  if verbose:
    f.seek(0)
    sys.stdout.write("🍎")
    sys.stdout.write("  " + f.read().replace("\n", "\n   ").rstrip() + "\n")

  f.close()

  out,err = subprocess.Popen(["osascript", f.name], stdout=subprocess.PIPE).communicate()

else:
    sys.stderr.write("🚫  No files to tag\n")