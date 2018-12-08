umask 022

GOROOT=/usr/local/opt/go
GOPATH=/home/jhoward/go
JAVA_HOME=/usr/local/opt/jdk-11
GRADLE_HOME=/usr/local/opt/gradle-4.10.2
PATH="$HOME/.cargo/bin:$PATH"
PATH="$GRADLE_HOME/bin:$PATH"
PATH="$HOME/bin:$JAVA_HOME/bin:$GOROOT/bin:$PATH"

export GOROOT GOPATH JAVA_HOME PATH GRADLE_HOME

## install rust: curl https://sh.rustup.rs -sSf | sh
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

export PATH="$HOME/.cargo/bin:$PATH"
