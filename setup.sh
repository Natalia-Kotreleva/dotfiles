# yay install
cd

sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Locales
# https://wiki.archlinux.org/title/Locale
# https://wiki.archlinux.org/title/Linux_console_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)/Keyboard_configuration_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)
# https://archlinux.org.ru/forum/topic/14673/?page=1
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
echo "ru_RU.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "KEYMAP=ruwin_alt_sh-UTF-8" >> /etc/vconsole.conf
# https://blackarch.ru/?p=186

# zsh install
yay zsh
# oh my zsh
# https://niklan.net/blog/149
echo ~/dotfiles/config/.zshrc > ~/.zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# theme ZSH_THEME="af-magic" for example
search=$(grep "ZSH_THEME" ~/.zshrc)
replace='ZSH_THEME="af-magic"'
sed -i "s|$search|$replace|" ~/.zshrc
# do it without ohmyzsh later

cp -r ~/dotfiles/config/.config/xfce4 ~/.config/xfce4

yay flameshot
# https://github.com/flameshot-org/flameshot

ssh-keygen -t rsa

git config --global user.name = "Natalia"
git config --global user.email = "natalia@o-din.ru"

# Ruby
# https://wiki.archlinux.org/title/Ruby
yay ruby
yay ruby-irb
yay ruby-stdlib
yay rubygems
# ruby build
# https://wiki.archlinux.org/title/Rbenv
yay ruby-build
yay rbenv

source ~/.zshrc
# https://wiki.archlinux.org/title/Ruby_on_Rails
gem install bundler
gem install rails

# Postgres
# https://wiki.archlinux.org/title/PostgreSQL_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)
yay postgresql
echo '
sudo -iu postgres
 initdb -D /var/lib/postgres/data'
echo 'sudo systemctl start postgresql
sudo -u postgres psql -c "CREATE ROLE odin WITH LOGIN SUPERUSER PASSWORD 'pass'"'
# https://www.linux.org.ru/forum/general/15367390

cd
mkdir projects
cd projects
mkdir gems

cat ~/.ssh/id_rsa.pub
echo 'add key to gitlab'

yay node
yay yarn

# https://dev.to/kesio/kak-ustanovit-redis-na-arch-linux-2dag
yay redis
sudo systemctl start redis
sudo systemctl enable redis

yay libreoffice