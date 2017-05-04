#!/bin/bash
MAP_FILE="/etc/atceph/rbdmap"

while read DEV PARAMS; do
      case "$DEV" in
      ""|\#*)
            continue
            ;;
      */*)
            ;;
      *)
            DEV=rbd/$DEV
            ;;
      esac

      OIFS=$IFS
      IFS=','
      for PARAM in ${PARAMS[@]}; do
            CMDPARAMS="$CMDPARAMS --$(echo $PARAM | tr '=' ' ')"
      done

      IFS=$OIFS
      if [ ! -b /dev/rbd/$DEV ]; then
            echo "rbd map $DEV $CMDPARAMS"
            rbd map $DEV $CMDPARAMS
      fi
done < $MAP_FILE
