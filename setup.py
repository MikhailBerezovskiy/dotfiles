import os

home_dir = os.environ["HOME"]
src = home_dir + "/dotfiles"
dst = home_dir


def main():
   os.symlink(src+"/.bashrc", dst+"/.bashrc")
   os.symlink(src+"/.vimrc", dst + "/.vimrc")

if __name__ == "__main__":
    main()
