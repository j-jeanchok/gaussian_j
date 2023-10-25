#!/bin/bash


#git clone https://github.com/NVIDIA/cuda-samples
#cd cuda-samples


git clone https://ceres-solver.googlesource.com/ceres-solver
cd ceres-solver
git checkout $(git describe --tags) # Checkout the latest release
mkdir build
cd build
cmake .. -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF -DCMAKE_CUDA_ARCHITECTURES=60;70;80 #-DUSE_CUDA=OFF 


make
sudo make install
cd ..
cd ..


git clone https://github.com/colmap/colmap
cd colmap
git checkout dev
mkdir build
cd build
cmake .. -DCMAKE_CUDA_ARCHITECTURES=60;70;80 #-DCUDA_ENABLED=OFF 
make
sudo make install
CC=/usr/bin/gcc-6 CXX=/usr/bin/g++-6 cmake ..
cd ..
cd ..


pip install -q plyfile 

python3.10 -m pip install -q https://huggingface.co/camenduru/gaussian-splatting/resolve/main/diff_gaussian_rasterization-0.0.0-cp310-cp310-linux_x86_64.whl
python3.10 -m pip install -q https://huggingface.co/camenduru/gaussian-splatting/resolve/main/simple_knn-0.0.0-cp310-cp310-linux_x86_64.whl

exit 0