## ATCEPH
Collection of Ceph helper tools.

## Description
cluster-df: shows cluster usage data per pool and global (including RBD provisioned space), 'ceph df' on steroids

osd-tree: shows osd tree in compact and simple way

rbd-backup: multithreaded RBD pool/image backup tool

scrub-schedule: shows scrubbing run statistics by date, useful for understanding how's your cluster is operating with scrubbing


scripts: helper scripts

scripts/pimp-my-elevator.sh: sets Linux IO scheduler for HDD and SSD disks

scripts/rbd-mapper.sh: maps RBD volumes from config


etc: configs

etc/config: main config

etc/exclude: list of RBD volumes which should be excluded from rbd-backup

etc/rbdmap: list of RBD volumes which should be mapped by rbd-mapper.sh

etc/rbd-mapper.service: systemd service file for rbd-mapper

## Usage

Consult '$COMMAND_NAME -h' for usage summary and list of supported keys

## Dependencies

* ruby >= 2.0

* ruby-json
