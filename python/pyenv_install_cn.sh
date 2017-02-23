#! /bin/bash
#
#auth:d_catch
#for the people in gfw
#using souhu source
#
pyenv install --list

echo 'wich version do you need'
read version
echo "input your pyenv's name:"
read version_name
wget http://mirrors.sohu.com/python/$version/Python-$version.tar.xz -P ~/.pyenv/cache/;
pyenv install $version
echo
echo "$version installed"
echo 'now active the version ,now '

pyenv virtualenv $version $version_name
echo
echo "begin the pyenv journey"
echo
echo "use 'pyenv activate $version_name' to use it"
echo
