#!/bin/sh
# Install packages for python3 and nodejs
sudo apt update -y
sudo apt-get install openssl libssl-dev libreadline-gplv2-dev libncursesw5-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev curl software-properties-common -y
curl -sL https://deb.nodesource.com/setup_12.x | bash -
sudo apt-get install nodejs -y
sudo apt-get install nodejs-dev node-gyp libssl1.0-dev -y
sudo apt-get install npm -y

# Python2 stuff
pip2 install ipython git+https://github.com/drorspei/ipython-autoimport git+https://github.com/drorspei/ipython-suggestions plotly qgrid --user
ipython profile create
python2 -m ipython_autoimport >> $(ipython locate profile)/ipython_config.py
python2 -m ipython_suggestions >> $(ipython locate profile)/ipython_config.py

# Install pyenv and python3.7.3 environment
curl https://pyenv.run | bash
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH
pyenv install 3.7.3
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv virtualenv 3.7.3 jlab

# Install jupyter lab and fix python2 kernel file
$HOME/.pyenv/versions/jlab/bin/pip install jupyterlab ipympl ipyparallel
cp kernel.json `$HOME/.pyenv/versions/jlab/bin/jupyter kernelspec list | grep python2 | awk '{print $2}'`/kernel.json

# Install extensions
$HOME/.pyenv/versions/jlab/bin/jupyter labextension install @jupyter-widgets/jupyterlab-manager @jupyterlab/plotly-extension jupyter-matplotlib jupyterlab-drawio qgrid
$HOME/.pyenv/versions/jlab/bin/jupyter nbextension enable --py widgetsnbextension

# Set alias
echo 'alias jlab="$HOME/.pyenv/versions/jlab/bin/jupyter lab"' >> $HOME/.bashrc