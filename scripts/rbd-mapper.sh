#!/bin/bash

if [ -f "/etc/atceph/config" ]; then
      conf="/etc/atceph/config"
else
      conf="/etc/atceph/config"
      pushd `dirname $0` > /dev/null
      RUNDIR=`pwd`
      WORKDIR="$(dirname ${RUNDIR})"
      conf="${WORKDIR}/config"
fi

MAP_FILE=`grep map_file ${conf} | awk -F'=' '{print $2}' | sed 's/"//g' | tr -d '[:space:]'`
if [ $MAP_FILE == "scripts/rbdmap" ]; then MAP_FILE="${RUNDIR}/rbdmap"; fi
CLIENT=`grep client ${conf} | awk -F'=' '{print $2}' | sed 's/"//g' | tr -d '[:space:]'`
CONFIG=`grep config ${conf} | awk -F'=' '{print $2}' | sed 's/"//g' | tr -d '[:space:]'`

while read DEV PARAMS; do
      case "$DEV" in
      ""|\#*)
            continue
            ;;
      esac

      if [ ! -b /dev/rbd/$DEV ]; then
            logger -s -t rbd-mapper "rbd map -c ${CONFIG} -n ${CLIENT} $DEV"
            map=`rbd map -c ${CONFIG} -n ${CLIENT} $DEV 2>&1`
            logger -s -t rbd-mapper $map
      else
            logger -s -t rbd-mapper "device $DEV already mapped"
      fi
done < $MAP_FILE
