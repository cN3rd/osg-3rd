mkdir -p build

if [[ "$(uname)" == CYGWIN* || "$(uname)" == MINGW* ]] ; then
	cmake_generator_config="-A x64 -Thost=x64"
else
    cmake_generator_config="-GNinja"
fi

cmake $cmake_generator_config -Bbuild/zlib -DBUILD_SHARED_LIBS=OFF -DZLIB_COMPAT=ON -DCMAKE_INSTALL_PREFIX="$(pwd)/build/zlib/install" repos/zlib-ng
cmake --build build/zlib --target install --config Debug
cmake --build build/zlib --target install --config Release

cmake $cmake_generator_config -Bbuild/minizip -DZLIB_ROOT="$(pwd)/build/zlib/install" -DMZ_COMPAT=ON -DZLIB_COMPAT=ON -DCMAKE_INSTALL_PREFIX="$(pwd)/build/minizip/install" -DCMAKE_DEBUG_POSTFIX="d" repos/minizip-ng
cmake --build build/minizip --target install --config Debug
cmake --build build/minizip --target install --config Release

cmake $cmake_generator_config -Bbuild/libjpeg -DCMAKE_INSTALL_PREFIX="$(pwd)/build/libjpeg/install" -DCMAKE_DEBUG_POSTFIX="d" repos/jpeg-cmake
cmake --build build/libjpeg --target install --config Debug
cmake --build build/libjpeg --target install --config Release

cmake $cmake_generator_config -Bbuild/giflib -DCMAKE_INSTALL_PREFIX="$(pwd)/build/giflib/install" -DGIFLIB_SOURCE_DIR="$(pwd)/repos/giflib/" -DCMAKE_DEBUG_POSTFIX="d" cmakes/giflib
cmake --build build/giflib --target install --config Debug
cmake --build build/giflib --target install --config Release

cmake $cmake_generator_config -Bbuild/libpng -DZLIB_ROOT="$(pwd)/build/zlib/install" -DPNG_SHARED=OFF -DCMAKE_INSTALL_PREFIX="$(pwd)/build/libpng/install" -DCMAKE_DEBUG_POSTFIX="d" repos/libpng
cmake --build build/libpng --target install --config Debug
cmake --build build/libpng --target install --config Release

cmake $cmake_generator_config -Bbuild/libjpeg -DLIBJPEG_SOURCE_DIR=$(pwd)/repos/libjpeg -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX="$(pwd)/build/libjpeg/install" -DCMAKE_DEBUG_POSTFIX="d" custom-cmakes/libjpeg/
cmake --build build/libjpeg --target install --config Debug
cmake --build build/libjpeg --target install --config Release

cmake $cmake_generator_config -Bbuild/libtiff -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX="$(pwd)/build/libtiff/install" -DCMAKE_DEBUG_POSTFIX="d" repos/libtiff/
cmake --build build/libtiff --target install --config Debug
cmake --build build/libtiff --target install --config Release

cmake $cmake_generator_config -Bbuild/c-ares -DCARES_SHARED=OFF -DCARES_STATIC=ON -DCMAKE_INSTALL_PREFIX="$(pwd)/build/c-ares/install" -DCMAKE_DEBUG_POSTFIX="d" repos/c-ares
cmake --build build/c-ares --target install --config Debug
cmake --build build/c-ares --target install --config Release

# TODO: add OpenSSL
cmake $cmake_generator_config -Bbuild/curl -DCURL_ZLIB=True -DZLIB_ROOT="$(pwd)/build/zlib/install" -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX="$(pwd)/build/curl/install" -DCMAKE_DEBUG_POSTFIX="d" repos/curl
cmake --build build/curl --target install --config Debug
cmake --build build/curl --target install --config Release