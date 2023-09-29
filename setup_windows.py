from pathlib import Path
import shutil


def setup_nvim():
    dst_dir = Path.home() / 'AppData' / 'Local' / 'nvim'
    shutil.rmtree(dst_dir, ignore_errors=True)
    shutil.copytree('nvim/.config/nvim', dst_dir)


def setup_git():
    ignore_dir = Path.home() / '.config' / 'git'
    ignore_dir.mkdir(parents=True, exist_ok=True)
    shutil.copy('git/.gitconfig', Path.home())


def main():
    setup_nvim()
    setup_git()


if __name__ == '__main__':
    main()
