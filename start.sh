#!/bin/sh

export PLEX_MEDIA_SERVER_MAX_PLUGIN_PROCS=6
export PLEX_MEDIA_SERVER_HOME=/usr/lib/plexmediaserver
export PLEX_MEDIA_SERVER_MAX_STACK_SIZE=3000
export PLEX_MEDIA_SERVER_TMPDIR=/tmp
export PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR="/config/Library/Application Support"

if [ ! -d "$PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR" ]
then
  mkdir -p "$PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR"
  if [ ! $? -eq 0 ]
  then
    echo "WARNING COULDN'T CREATE $PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR, MAKE SURE I HAVE PERMISSON TO DO THAT!"
    exit 1
  fi
fi

export LD_LIBRARY_PATH="${PLEX_MEDIA_SERVER_HOME}"
export TMPDIR="${PLEX_MEDIA_SERVER_TMPDIR}"

echo $PLEX_MEDIA_SERVER_MAX_PLUGIN_PROCS $PLEX_MEDIA_SERVER_MAX_STACK_SIZE $PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR

ulimit -s $PLEX_MAX_STACK_SIZE
rm -rf /config/Library/Application\ Support/Plex\ Media\ Server/plexmediaserver.pid

(cd /usr/lib/plexmediaserver; ./Plex\ Media\ Server)

