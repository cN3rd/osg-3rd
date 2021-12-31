# build dependencies
echo "creating install directory..."
rm -rf install
mkdir -p install
cp -r build/zlib/install/* install
cp -r build/minizip/install/* install
cp -r build/libjpeg/install/* install
cp -r build/giflib/install/* install
cp -r build/libpng/install/* install
cp -r build/libjpeg/install/* install
cp -r build/libtiff/install/* install
cp -r build/c-ares/install/* install
cp -r build/curl/install/* install
cp -r build/freetype/install/* install
cp -r build/nghttp2/install/* install
cp -r build/glew/install/* install

# move freetype 2 headers back a little
echo "fixing freetype includes..."
mv install/include/freetype2/* install/include
rm -rf install/include/freetype2

# rename zlib to match
echo "fixing zlib library name..."
mv install/lib/zlibstaticd.lib install/lib/zlibd.lib
mv install/lib/zlibstatic.lib install/lib/zlib.lib

# rename libpng artifacts
echo "fixing libpng library name..."
mv install/lib/libpng16_staticd.lib install/lib/libpng16d.lib
mv install/lib/libpng16_static.lib install/lib/libpng16.lib

# build package
tar -zcvf install.tar.gz install