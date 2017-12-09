#!/bin/bash
for i in `ls -rv ddfs.info*`; do cat $i >> full_ddfs_info.out; done
