"""
Setup my dot files
#TODO: add dirscan for dotfiles and create symlinks in home dir
"""
import os
import logging

HOME_DIR = os.environ['HOME']
SRC = HOME_DIR + '/dotfiles'
DST = HOME_DIR

logger = logging.getLogger('dotfiles')
logger.setLevel(logging.DEBUG)


def main():
    try:
        os.symlink(SRC + '/.bashrc', DST + '/.bashrc')
        os.symlink(SRC + '/.vimrc', DST + '/.vimrc')
        os.symlink(SRC + '/.Xresources', DST + '/.Xresources')
    except OSError as err:
        logger.warn(err)
        pass


if __name__ == "__main__":
    # main()
    d = os.scandir(SRC)
    print(d)
    print(list(d))
