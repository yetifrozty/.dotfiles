#!/usr/bin/python3
import sys, os

if len(sys.argv) == 1 or sys.argv[1] == '--help' or sys.argv[1] == '-h':
    print(sys.argv)
    print('copy file or folder over to dotfiles and stow them')
    sys.exit(0)

curdir = os.getcwd()
user_dir = os.getenv('HOME')

#Exit if the dotfile(s) doesn't exist.
if not os.path.exists(sys.argv[1]):
    print(os.path.join(sys.argv[1]) + 'doesn\'t exist')
    sys.exit(1)

#If the dotfile(s) are already symlinked, it will break the config. My polybar and nitrogen config died because of this lol
if os.path.islink(os.path.abspath(sys.argv[1])):
    print('File is already symlinked. May break things.')
    sys.exit(1)

#I dont think stow can handle files outside the home directory and, there will be problems with permissons to.
if os.path.abspath(sys.argv[1]).startswith(user_dir):
    path = os.path.abspath(sys.argv[1])[len(user_dir):]
else:
    print('dotfiles must be in home directory')
    sys.exit(1)

#ask if the user wants to continue
action = input('continue? y/n: ')
if action == 'y' or action == 'yes':
    print('proceeding')
else:
    print('Exiting config manager.')
    sys.exit(0)

dotfiles_dir = os.path.join(f'~/.dotfiles{path}')
if os.path.exists(dotfiles_dir):
    action = input('Dotfile(s) already exist, do you want to remove it? y/n: ')
    if action == 'y' or action == 'yes':
        action = input('Are you sure? y/n: ')
        if action == 'y' or action == 'yes':
            os.system(f'rm -rf {dotfiles_dir}')
    elif action == 'n' or action == 'no':
        action = input(f'do you still want to symlink the dotfile(s) saved in "~/.dotfiles" to "~{path}"? this will remove "~{path}" y/n: ')
        if action == 'y' or action == 'yes':
            action = input('Are you sure? y/n')
            if action == 'y' or action == 'yes':
                os.system('rm -rf {sys.argv[1]}')
        else:
            print('Exiting')
            sys.exit(1)


os.system(f'mkdir -p {os.path.dirname(dotfiles_dir)}')
os.system(f'mv {sys.argv[1]} {dotfiles_dir}')
os.system('stow -t ~ -d ~/.dotfiles .')

