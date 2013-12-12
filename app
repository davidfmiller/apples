#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
Open/activate a Mac application from the terminal
"""

import sys
import os
import getopt
import tempfile
import subprocess

if __name__ != '__main__':
  sys.stderr.write("🚫  Incorrect usage\n")
  sys.exit(2)

try:
  opts, args = getopt.getopt(sys.argv[1:], 'v', ['verbose'])
except getopt.GetoptError:
  sys.stderr.write("🚫  Incorrect usage\n")
  sys.exit(2)

if not args:
  args = []

script = ""
activate = False
verbose = False

for opt, arg in opts:

  if opt == '-v' or opt == '--verbose':
    verbose = True

apps = []
cmd = ''

if len(args):
  for word in args:
    app = " ".join([word[0].upper() + word[1:] for word in word.split()])
    if app == 'coda':
      app = 'Coda 2'
    apps.append(app)

for a in apps:
  cmd += "tell application \"" + a + "\"\n  activate \nend tell\n" 

if cmd:
  f = tempfile.NamedTemporaryFile(delete=False)

  f.write(cmd)

  if verbose:
    f.seek(0)
    sys.stdout.write("🍎")
    sys.stdout.write("  " + f.read().replace("\n", "\n   ").rstrip() + "\n")

  f.close()

  out,err = subprocess.Popen(["osascript", f.name], stdout=subprocess.PIPE).communicate()

else:
    sys.stderr.write("🚫  Nothing to do\n")