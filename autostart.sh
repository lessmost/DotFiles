#!/bin/sh

#Turn on numlock
# numlockx on

#Start remind non-timed
#remind -q -g -a -k'gxmessage -center -title "Non-timed reminders" %s &' ~/.reminders

#Start remind daemon for timed reminder
remind -z -k'gxmessage -timeout 300 -center -title "Timed reminders" %s &' ~/.reminders &

#Start goagent local
python2 ~/data/Dropbox/goagent/local/proxy.py &

# emacs daemon
emacs --daemon &

