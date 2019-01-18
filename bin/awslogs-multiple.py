#!/usr/bin/env python3
import sys
import itertools
import subprocess

def watch(groups, extra_args):
    if not groups:
        raise RuntimeError('Specify at least a group')

    processes = []
    args = ['awslogs', 'get'] + extra_args
    for group in groups:
        process_args = args + [group]
        print('Starting', ' '.join(process_args))
        processes.append(subprocess.Popen(process_args))

    for process in processes:
        process.wait()

def main():
    if len(sys.argv) > 1 and sys.argv[1] in ('help', '--help', '-h'):
        print_help()
        exit(0)
    not_delimitier = lambda x: x != '--'
    groups = list(itertools.takewhile(not_delimitier, sys.argv[1:]))
    extra_args = list(itertools.dropwhile(not_delimitier, sys.argv))
    watch(groups, extra_args[1:])

def print_help():
    import os
    name = os.path.basename(__file__)
    print(f"""Usage:
{name} multiple groups can be here -- -ws 1d -i 1
{name} $(awslogs groups -p /ecs/staging/my-app) -- -ws 1d -i 1
""")


if __name__ == '__main__':
    main()
