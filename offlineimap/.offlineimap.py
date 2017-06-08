#!/usr/bin/env python2
import re, os

def get_password_emacs(machine, login, port):
    s = "machine %s login %s port %s password ([^ ]*)\n" % (machine, login, port)
    p = re.compile(s)
    authinfo = os.popen("gpg -q --batch -d ~/.authinfo.gpg").read()
    return p.search(authinfo).group(1)

# import subprocess
# def get_output(cmd):
#   # Bunch of boilerplate to catch the output of a command:
#   pipe = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
#   (output, errout) = pipe.communicate()
#   assert pipe.returncode == 0 and not errout
#   return output

# def get_password_emacs(host, port):
#   cmd = "emacsclient --eval '(offlineimap-get-password \"%s\" \"%s\")'" % (host,port)
#   return get_output(cmd).strip().lstrip('"').rstrip('"')
