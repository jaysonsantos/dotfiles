# -*- coding: utf-8 -*-
"""Git tools."""
from plumbum import ProcessExecutionError
from plumbum.cmd import git, rg, cut
from shlex import split


def run_command(*args, dry_run=False):
    """Run a git command, print it before executing and capture the output."""
    command = git[split(' '.join(args))]
    print('{}{}'.format('[DRY-RUN] ' if dry_run else '', command))
    if dry_run:
        return ''
    return command()


def branch_exists(branch):
    """Return True if the branch exists."""
    try:
        run_command('rev-parse --verify {}'.format(branch))
        return True
    except ProcessExecutionError:
        return False


def prune_local_branch():
    """Remove local branches that would be pruned remotely."""
    print('Removing local branches that can be pruned remotely...')
    output = run_command('remote prune --dry-run origin')
    if not output:
        print('There are no remote branches to prune')
        exit()

    raw_branch_lines = output.splitlines()[2:]
    local_branches = [line.split('/', 1)[-1] for line in raw_branch_lines]
    for branch in local_branches:
        if branch_exists(branch):
            run_command('branch --delete --force {}'.format(branch))
