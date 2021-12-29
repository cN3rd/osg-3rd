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
tar -zcvf install.tar.gz install