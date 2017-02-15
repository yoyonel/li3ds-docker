#!/usr/bin/env python

import argparse
import os
import sys


def parse_args():
    """
    """
    parser = argparse.ArgumentParser()
    parser.add_argument(
        '--root_path',
        type=str,
        default=os.environ.get('LI3DS_ROOT_PATH'),
        help='root path of the LI3DS depo (default: %(default)s)'
    )
    return parser.parse_args()


def extract_tag(args):
    """
    """
    # get the current path (place where we invoke this script)
    cur_path = os.getcwd()
    #
    subdirs = cur_path.split(args.root_path)
    subdir = subdirs[-1]
    #
    dirname = os.path.dirname(subdir)
    basename = os.path.basename(subdir)
    #
    tag = "%s:%s" % (dirname, basename)
    #
    return tag


if __name__ == '__main__':
    # Parser
    args = parse_args()

    # Compute result
    result = extract_tag(args)

    # Print out the result
    sys.stdout.write(result)
