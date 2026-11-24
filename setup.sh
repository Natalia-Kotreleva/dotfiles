# yay install
cd
sudo pacman -S --needed --noconfirm base-devel git
git clone https://aur.archlinux.org/yay.git /tmp/yay
(cd /tmp/yay && makepkg -si --noconfirm)
rm -rf /tmp/yay

# Locales
# https://wiki.archlinux.org/title/Locale
# https://wiki.archlinux.org/title/Linux_console_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)/Keyboard_configuration_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)
# https://archlinux.org.ru/forum/topic/14673/?page=1
# https://blackarch.ru/?p=186
echo -e "en_US.UTF-8 UTF-8\nru_RU.UTF-8 UTF-8" | sudo tee /etc/locale.gen
sudo locale-gen
echo "LANG=en_US.UTF-8" | sudo tee /etc/locale.conf
echo "KEYMAP=ruwin_alt_sh-UTF-8" | sudo tee /etc/vconsole.conf
sudo localectl set-x11-keymap us,ru pc105 "" grp:alt_shift_toggle


# Zsh
# https://niklan.net/blog/149
# https://github.com/flameshot-org/flameshot
# https://wiki.archlinux.org/title/Ruby
# ruby build
# https://wiki.archlinux.org/title/Rbenv

yay -S --needed --noconfirm \
    zsh zsh-autosuggestions zsh-syntax-highlighting starship \
    flameshot \
    ruby-build rbenv \
    postgresql redis \
    nodejs yarn \
    libreoffice-fresh \
    open-vm-tools gtkmm3

ln -sf ~/dotfiles/config/.zshrc ~/.zshrc
sudo chsh -s /usr/bin/zsh "$USER"

# xfce4
rm -rf ~/.config/xfce4
ln -s ~/dotfiles/config/.config/xfce4 ~/.config/xfce4

git config --global user.name "Natalia"
git config --global user.email "natalia@o-din.ru"
ssh-keygen -t rsa


# Ruby on Rails
# https://wiki.archlinux.org/title/Ruby_on_Rails
export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
rbenv install 3.3.10
rbenv global 3.3.10
gem install bundler rails

# PostgreSQL Redis
# https://wiki.archlinux.org/title/PostgreSQL_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)
sudo -iu postgres initdb -D /var/lib/postgres/data
sudo systemctl enable --now postgresql redis vmtoolsd
sudo -u postgres psql -c "CREATE ROLE odin WITH LOGIN SUPERUSER PASSWORD 'pass';"


mkdir -p ~/projects/gems
cat ~/.ssh/id_rsa.pub
echo 'add key to gitlab'
