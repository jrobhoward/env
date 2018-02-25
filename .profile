umask 022

GOROOT=/usr/local/opt/go
GOPATH=/home/jhoward/go
JAVA_HOME=/usr/local/opt/zulu9.0.4.1-jdk9.0.4-linux_x64
PATH="$HOME/.cargo/bin:$PATH"
PATH="$HOME/bin:$JAVA_HOME/bin:$GOROOT/bin:$PATH"

export GOROOT GOPATH JAVA_HOME PATH


## make ~/go
## make ~/.sh_histdir
## move existing files aside
## make idempotent (i.e. fix symlinks, if necessary)
## install rust: curl https://sh.rustup.rs -sSf | sh

