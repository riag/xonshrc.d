# coding:utf-8

import os, sys

init_local_file = os.path.join($XONSHRCD_DIR, 'init.xsh.local')
if os.path.isfile(init_local_file):
    source_alias([init_local_file])
