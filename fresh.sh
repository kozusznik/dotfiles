#!/bin/sh

DOTFILES=$HOME/.dotfiles

if [ $(uname) = "Darwin" ]; then
  echo "Setting up your Mac..."
else
  echo "Setting up your " $(uname) "..."
fi

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

if [ $(uname) = "Darwin" ]; then
  # Check for Homebrew and install if we don't have it
  if test ! $(which brew); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc


if [ $(uname) = "Darwin" ]; then
  # Update Homebrew recipes
  brew update

  # Install all our dependencies with bundle (See Brewfile)
  brew tap homebrew/bundle
  brew bundle --file $DOTFILES/Brewfile
fi

# Set default MySQL root password and auth type
#mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Install PHP extensions with PECL
#pecl install imagick redis swoole

# Install global Composer packages
#/usr/local/bin/composer global require laravel/installer laravel/valet beyondcode/expose spatie/global-ray spatie/visit

# Install Laravel Valet
#$HOME/.composer/vendor/bin/valet install

# Install Global Ray
#$HOME/.composer/vendor/bin/global-ray install

# Create a Sites directory
#mkdir $HOME/Sites

# Create sites subdirectories
#mkdir $HOME/Sites/blade-ui-kit
#mkdir $HOME/Sites/laravel

# Clone Github repositories
$DOTFILES/clone.sh

if [ $(uname) = "Darwin" ]; then
  # Symlink the Mackup config file to the home directory
  ln -s $DOTFILES/.mackup.cfg $HOME/.mackup.cfg
fi

# Set macOS preferences - we will run this last because this will reload the shell
#source $DOTFILES/.macos
