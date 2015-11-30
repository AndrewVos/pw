# pw

Bash script to handle symettrically encrypted passwords file.

# features

auto complete passwords
copy username/password to clipboard

## installation

```
sudo curl https://raw.githubusercontent.com/AndrewVos/pw/master/pw -o /usr/local/bin/pw
sudo chmod +x /usr/local/bin/pw

sudo curl https://raw.githubusercontent.com/AndrewVos/pw/master/pw_autocomplete.sh -o /usr/local/bin/pw_autocomplete.sh
sudo chmod +x /usr/local/bin/pw_autocomplete.sh

pw --create-password-file
```

Add the following to ~/.bashrc:

```
source /usr/local/bin/pw_autocomplete.sh
```

## dependencies

`gpg2` and `gpg-agent`.

```
sudo apt-get install gnupg-agent gnupg2
```

For gpg-agent to work properly, you need to add this to `~/.bashrc`:

```
eval $(gpg-agent --daemon)
```

## development

```
sudo ln -s `pwd`/pw /usr/local/bin/pw
sudo ln -s `pwd`/pw_autocomplete.sh /usr/local/bin/pw_autocomplete.sh
```
