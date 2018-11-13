# coding:utf-8

import os, sys

xontrib load coreutils
xontrib load bashisms
xontrib load distributed
xontrib load mpl
xontrib load prompt_ret_code
xontrib load free_cwd
xontrib load whole_word_jumping
xontrib load vox
xontrib load powerline
xontrib load prompt_vi_mode

aliases['cp'] = ['shx', 'cp']
aliases['tempdir'] = ['shx', 'tempdir']
aliases['ls'] = ['shx', 'ls']
aliases['find'] = ['shx', 'find']
aliases['grep'] = ['shx', 'grep']
aliases['head'] = ['shx', 'head']
aliases['ln'] = ['shx', 'ln']
aliases['mkdir'] = ['shx', 'mkdir']
aliases['rm'] = ['shx', 'rm']
aliases['mv'] = ['shx', 'mv']
aliases['sed'] = ['shx', 'sed']
aliases['sort'] = ['shx', 'sort']
aliases['tail'] = ['shx', 'tail']
aliases['touch'] = ['shx', 'touch']
aliases['uniq'] = ['shx', 'uniq']

origin_sudo_func = aliases['sudo']
def _my_sudo(args, stdin=None):
    if not args:return origin_sudo_func(None)

    cmd = args[0]
    if cmd not in aliases:
        return origin_sudo_func(args)

    t = aliases[cmd]
    cmd = []
    cmd_args = []
    if len(args)>1:
        cmd_args.extend(args[1:])
    if type(t) in (list, tuple):
        cmd.extend(t)
        cmd.extend(cmd_args)
    else:
    	cmd.extend(['xonsh', '-i', '-c', "'%s'" % ' '.join(args)])

    return origin_sudo_func(cmd)

aliases['sudo'] = _my_sudo


init_local_file = os.path.join($XONSHRCD_DIR, 'init.xsh.local')
if os.path.isfile(init_local_file):
    source_alias([init_local_file])
