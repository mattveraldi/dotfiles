if ! test -d ~/.oh-my-bash; then
	bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
fi

if ! test -f .z; then
	git clone https://github.com/rupa/z.git
fi
