## ATCEPH
Collection of Ceph helper tools.

## Description
cluster-df: shows cluster usage data per pool and global (including RBD provisioned space), "ceph df" on steroids

osd-tree: shows osd tree in compact and simple way

scrub-schedule: shows scrubbing run statistics by date, useful for understanding how's your cluster is operating with scrubbing

scripts: helper scripts, primary for Linux tuning

scripts/pimp-my-elevator.sh: sets Linux IO scheduler for HDD and SSD disks

## Dependencies

* ruby >= 2.0

* ruby-json
