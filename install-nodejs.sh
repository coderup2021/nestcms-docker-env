#!/usr/bin/env bash

export NVM_DIR="$HOME/.nvm"
let i=0
while [ ! -s "$NVM_DIR/nvm.sh" ]; do
	if [ "${i}" != "0" ]; then
		echo "retry ${i}"
	fi
	wget --no-check-certificate -qO- https://gitee.com/coderup2021/nvm/attach_files/1047156/download/install-nvm.sh | bash
	((i++))
done

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  && # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" && # This loads nvm bash_completion

NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node nvm install 16.18.1 && 
nvm use 16.18.1 && 

echo "" && 

echo nodejs version: `node -v` && 

echo npm version: `npm -v` && 

npm config -g set registry "https://registry.npmmirror.com" && 

echo npm registry: `npm config get registry` && 

npm install -g yarn &&

yarn config set registry "https://registry.npmmirror.com" --global &&
echo ""
