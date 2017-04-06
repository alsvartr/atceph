#!/bin/bash

SSD_ELEVATOR="noop"
HDD_ELEVATOR="cfq"

for i in `ls /sys/block/`
do
        elevator=`cat /sys/block/$i/queue/scheduler`
        if [ "$elevator" == "none" ]; then
                continue
        fi

        rotational=`cat /sys/block/$i/queue/rotational`
        if [ "$rotational" == "0" ]; then
                ELEVATOR=${SSD_ELEVATOR}
        else
                ELEVATOR=${HDD_ELEVATOR}
        fi

        echo $ELEVATOR > /sys/block/$i/queue/scheduler
        echo "SET $ELEVATOR TO /dev/$i"
done
