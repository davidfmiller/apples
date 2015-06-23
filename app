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

app = None

if len(args) == 0:
  sys.stderr.write("🚫  No app specified\n");
  sys.exit(2)

app = args.pop(0);

app = app[0].upper() + app[1:]

if app == 'Activity':
  app = 'Activity Monitor'
elif app == 'Store':
  app = 'App Store'
elif app == 'Hijack':
  app = 'Audio Hijack Pro'
elif app == 'Coda':
  app = 'Coda 2'
elif app == 'Chrome':
  app = 'Google Chrome'
elif app == 'Mission':
  app = 'Mission Control'
elif app == 'Fantastical':
  app = 'Fantastical 2'
if app == 'Gh':
  app = 'Github'
elif app == 'Earth':
  app = 'Google Earth'
elif app == 'Capture':
  app = 'Image Capture'
elif app == 'Maestro':
  app = 'Keyboard Maestro'
elif app == 'Snitch':
  app = 'Little Snitch Configuration'
elif app == 'Notational':
  app = 'Notational Velocity'
elif app == 'Booth':
  app = 'Photo Booth'
elif app == 'Qt' or app == 'Quicktime':
  app = 'Quicktime Player'
elif app == 'Prefs' or app == 'Preferences':
  app = 'System Preferences'
elif app == 'Time':
  app = 'Time Machine'
elif app == 'Transporter':
  app = 'Transporter Desktop'


# loop through all files
for arg in args:

  path = os.path.join(os.getcwd(), arg)

  if not os.path.exists(path):
    sys.stderr.write("📄  " + path + " does not exist\n")
    continue

  cmd += "  set f to POSIX file \"" + path + "\"\n  open f" + "\n"


cmd = "tell application \"" + app + "\"\n" + cmd + "  activate\nend tell\n"
f = tempfile.NamedTemporaryFile(delete=False)

f.write(cmd)

if verbose:
  f.seek(0)
  sys.stdout.write("🍎")
  sys.stdout.write("  " + f.read().replace("\n", "\n   ").rstrip() + "\n")

f.close()

out,err = subprocess.Popen(["osascript", f.name], stdout=subprocess.PIPE).communicate()
