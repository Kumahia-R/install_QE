#!/bin/bash

line_of_equals="=================================="
startup_message="Setting up Quantum Espresso..."

echo $line_of_equals
echo $startup_message
echo $line_of_equals

:'echo $line_of_equals
echo "Cleaning old files"
echo $line_of_equals

# Put all your module load commands here one after the other
echo $line_of_equals
echo "Loading all required modules.."
echo $line_of_equals

module load OpenMPI
module load OpenBLAS
module load ScaLAPACK
module load FFTW
'
# Go to base directory where things will be installed.
# Everything specific to a certain app should be in the application folder
home="/home/kurt/q-e-demo"
cd "$home"

# Dependencies
# For QE, dependencies will be git version 2.32.0 and cmake version 3.21.0
# Git v2.32.0 install
echo $line_of_equals
echo "Downloading dependencies..."
echo $line_of_equals

wget 'https://github.com/git/git/archive/refs/tags/v2.32.0.tar.gz'
mv v2.32.0.tar.gz git-2.32.0.tar.gz
tar zxf git-2.32.0.tar.gz
cd git-2.32.0
make configure
./configure --prefix=/home/kurt
make all doc info
make install

# cmake v3.21.0
#wget https://github.com/Kitware/CMake/releases/download/v3.21.0/cmake-3.21.0.tar.gz
#tar -zvxf cmake.3.21.tar.gzcd cmake.3.21.0
#./bootstrap
#gmake


# QE
#wget http://prdownloads.sourceforge.net/scons/scons-4.0.1.zip
#unzip scons-4.0.1.zip
#cd SCons-4.0.1
#export PYTHONPATH=/home/kurt/reproducibility/lib/python3.6/site-packages/
#python3 setup.py install --prefix="$home"

# Download source code
#cd ..
#git clone --recurse-submodules https://github.com/asrivast28/ramBLe.git
#cd ramBLe
#scons TEST=0 TIMING=1 LOCALINCLUDES="$home"/boost_1_70_0/ LOCALLIBS="$home"/boost_libs/lib/
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"$home"/boost_libs/lib/# qe_install
