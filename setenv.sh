export PATH=$HOME/.nimble/bin:$HOME/nim/bin:$PATH
export NIM_LIB_PREFIX=$HOME/nim
# cp ~/.bash_profile ~/.bash_profile2; cat ~/.bash_profile2 | grep -v '/.nimble' > ~/.bash_profile
if [ -e ~/.bash_profile ] ; then
    echo ".bash profile exists"  
else
    touch ~/.bash_profile
fi
sed -i.bak '/.nimble/d' ~/.bash_profile
sed -i.bak '/NIM_LIB_PREFIX/d' ~/.bash_profile
echo 'export PATH=$HOME/.nimble/bin:$HOME/nim/bin:$PATH' >> $HOME/.bash_profile
echo 'export NIM_LIB_PREFIX=$HOME/nim' >> $HOME/.bash_profile

export NIM_LIB_PREFIX=$HOME/nim
export PATH=$HOME/.nimble/bin:$HOME/nim/bin:$PATH