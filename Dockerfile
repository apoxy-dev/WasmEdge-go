FROM ubuntu:20.04 as build-stage

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    software-properties-common cmake libboost-all-dev dpkg-dev \
    wget curl cmake ninja-build git

RUN echo "deb http://apt.llvm.org/focal/ llvm-toolchain-focal main" >> /etc/apt/sources.list.d/llvm.list && \
    echo "deb http://apt.llvm.org/focal/ llvm-toolchain-focal-13 main" >> /etc/apt/sources.list.d/llvm.list && \
    wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
    apt-get update && apt-get install -y \
    llvm-13-dev liblld-13-dev clang-13

RUN git clone https://github.com/WasmEdge/WasmEdge.git && \
    cd WasmEdge && \
    git checkout 0.11.2 && \
    mkdir -p build && cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release -DWASMEDGE_BUILD_SHARED_LIB=Off \
          -DWASMEDGE_BUILD_STATIC_LIB=On -DWASMEDGE_LINK_TOOLS_STATIC=On \
          -DWASMEDGE_BUILD_PLUGINS=On \
	  -DWASMEDGE_PLUGIN_WASI_CRYPTO=On -DWASMEDGE_PLUGIN_HTTPSREQ=On .. && \
    make

FROM scratch AS export-stage
COPY --from=build-stage /WasmEdge/build/lib/api/libwasmedge.a /
