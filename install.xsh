# xonsh
# coding:utf-8

import os,sys, shutil
from xonsh.platform import ON_WINDOWS


current_path = os.path.abspath(os.getcwd())

xonrc_path = os.path.expanduser('~/.xonshrc')
xonrc_tpl_path = os.path.join(current_path, 'templates/xonshrc.template')

# copy xonrc.template to ~/.xonrc
shutil.copy(xonrc_tpl_path, xonrc_path)

# ln current path to ~/.xonrc.d
src=current_path
dst=os.path.expanduser('~/.xonshrc.d')
os.symlink(src, dst, target_is_directory=True)

echo "install finish!"
