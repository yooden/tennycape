#!  /bin/sh

#   run as user postgres
#
#   My installation uses either "peer" or "m5", but still does not ask for
#   a password (as promised by createuser's man page).

createuser --createdb --encrypted --pwprompt --no-createrole --no-superuser tennycape
