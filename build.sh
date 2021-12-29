mkdir -p build

cmake -G"Ninja Multi-Config" -Bbuild/zlib -DBUILD_SHARED_LIBS=OFF -DZLIB_COMPAT=ON -DCMAKE_INSTALL_PREFIX="$(pwd)/build/zlib/install" repos/zlib-ng
cmake --build build/zlib --target install --config Debug
cmake --build build/zlib --target install --config Release

cmake -G"Ninja Multi-Config" -Bbuild/minizip -DZLIB_ROOT="$(pwd)/build/zlib/install" -DMZ_COMPAT=ON -DZLIB_COMPAT=ON -DCMAKE_INSTALL_PREFIX="$(pwd)/build/minizip/install" -DCMAKE_DEBUG_POSTFIX="d" repos/minizip-ng
cmake --build build/minizip --target install --config Debug
cmake --build build/minizip --target install --config Release

cmake -G"Ninja Multi-Config" -Bbuild/libjpeg -DCMAKE_INSTALL_PREFIX="$(pwd)/build/libjpeg/install" -DBUILD_STATIC_LIBS=ON -DBUILD_SHARED_LIBS=OFF -DCMAKE_DEBUG_POSTFIX="d" repos/jpeg-cmake
cmake --build build/libjpeg --target install --config Debug
cmake --build build/libjpeg --target install --config Release

cmake -G"Ninja Multi-Config" -Bbuild/giflib -DCMAKE_INSTALL_PREFIX="$(pwd)/build/giflib/install" -DGIFLIB_SOURCE_DIR="$(pwd)/repos/giflib/" -DCMAKE_DEBUG_POSTFIX="d" cmakes/giflib
cmake --build build/giflib --target install --config Debug
cmake --build build/giflib --target install --config Release

cmake -G"Ninja Multi-Config" -Bbuild/libpng -DZLIB_ROOT="$(pwd)/build/zlib/install" -DPNG_SHARED=OFF -DCMAKE_INSTALL_PREFIX="$(pwd)/build/libpng/install" -DCMAKE_DEBUG_POSTFIX="d" repos/libpng
cmake --build build/libpng --target install --config Debug
cmake --build build/libpng --target install --config Release

cmake -G"Ninja Multi-Config" -Bbuild/libjpeg -DLIBJPEG_SOURCE_DIR=$(pwd)/repos/libjpeg -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX="$(pwd)/build/libjpeg/install" -DCMAKE_DEBUG_POSTFIX="d" custom-cmakes/libjpeg/
cmake --build build/libjpeg --target install --config Debug
cmake --build build/libjpeg --target install --config Release

cmake -G"Ninja Multi-Config" -Bbuild/libtiff -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX="$(pwd)/build/libtiff/install" -DCMAKE_DEBUG_POSTFIX="d" repos/libtiff/
cmake --build build/libtiff --target install --config Debug
cmake --build build/libtiff --target install --config Release

cmake -G"Ninja Multi-Config" -Bbuild/nghttp2 -DENABLE_STATIC_LIB=ON -DENABLE_SHARED_LIB=OFF -DCMAKE_INSTALL_PREFIX="$(pwd)/build/nghttp2/install" -DCMAKE_DEBUG_POSTFIX="d" repos/nghttp2/
cmake --build build/nghttp2 --target install --config Debug
cmake --build build/nghttp2 --target install --config Release

cmake -G"Ninja Multi-Config" -Bbuild/c-ares -DCARES_SHARED=OFF -DCARES_STATIC=ON -DCMAKE_INSTALL_PREFIX="$(pwd)/build/c-ares/install" -DCMAKE_DEBUG_POSTFIX="d" repos/c-ares
cmake --build build/c-ares --target install --config Debug
cmake --build build/c-ares --target install --config Release

cmake -G"Ninja Multi-Config" -Bbuild/freetype -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX="$(pwd)/build/freetype/install" -DCMAKE_DEBUG_POSTFIX="d" repos/freetype
cmake --build build/freetype --target install --config Debug
cmake --build build/freetype --target install --config Release

cmake -G"Ninja Multi-Config" -Bbuild/glew -DGLEW_DIR="repos/glew/auto" -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX="$(pwd)/build/glew/install" -DCMAKE_DEBUG_POSTFIX="d" repos/glew/
cmake --build build/glew --target install --config Debug
cmake --build build/glew --target install --config Release

# TODO: add OpenSSL
cmake -G"Ninja Multi-Config" -Bbuild/curl -DCURL_ZLIB=True -DZLIB_ROOT="$(pwd)/build/zlib/install" -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX="$(pwd)/build/curl/install" -DCMAKE_DEBUG_POSTFIX="d" repos/curl
cmake --build build/curl --target install --config Debug
cmake --build build/curl --target install --config Release