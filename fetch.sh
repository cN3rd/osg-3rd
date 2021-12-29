curl -kLO https://downloads.sourceforge.net/project/giflib/giflib-5.2.1.tar.gz
tar -xvf giflib-5.2.1.tar.gz
mv giflib-5.2.1 repos/giflib
rm -rf giflib-5.2.1.tar.gz

curl -kLO https://github.com/nigels-com/glew/releases/download/glew-2.2.0/glew-2.2.0.tgz
tar -xvf glew-2.2.0.tgz
mv glew-2.2.0 repos/glew
rm -rf glew-2.2.0.tgz
