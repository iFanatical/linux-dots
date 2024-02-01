#! /bin/sh
tree /sys/ -ifP 'gpu_busy_percent' --prune | grep gpu_busy | cat