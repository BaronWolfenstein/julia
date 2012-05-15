#!/usr/bin/make -f

PREFIX=/opt/local

LLVM_CONFIG=llvm-config-mp-3.0
CFLAGS='-02 -I${PREFIX}/include -I${PREFIX}/include/ufsparse'
CXXFLAGS='-02'
LDFLAGS='-L${PREFIX}/lib'
CC=/usr/bin/llvm-gcc-4.2
CXX=/usr/bin/llvm-g++-4.2
CPP=/usr/bin/llvm-cpp-4.2
FC=${PREFIX}/bin/gfortran-mp-4.5
USEGCC=1

all: default
default test:
	$(MAKE) -f repackage_system_suitesparse.make USE_DEBIAN=1 CFLAGS=${CFLAGS} CXXFLAGS=${CXXFLAGS} LDFLAGS=${LDFLAGS}
	$(MAKE) -C .. USE_DEBIAN=1 LLVM_CONFIG=${LLVM_CONFIG} \
		PREFIX=${PREFIX} CFLAGS=${CFLAGS} CXXFLAGS=${CXXFLAGS} LDFLAGS=${LDFLAGS} \
		CC=${CC} CXX=${CXX} CPP=${CPP} FC=${FC} USEGCC=1 $@
