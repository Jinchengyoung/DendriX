# MPI reconfiguration...

ifndef MPI
$(error THIS FILE SHOULD ONLY BE LOADED WITH MPI defined)
endif

# JC for local machine: Ubuntu 20.04, gfortran 9.4
ifeq ($(HOST),DESKTOP-JHPFKC2) 
  MPIHOME=/usr/local
  mpi_include_dir = $(MPIHOME)/include
  mpi_lib_dir = $(MPIHOME)/lib
  mpi_libraries += -lmpich -lmpi

  FC = $(MPIHOME)/bin/mpifort
  F90 = $(MPIHOME)/bin/mpifort
  CC = $(MPIHOME)/bin/mpicc
  CXX = $(MPIHOME)/bin/mpicxx
endif


#JC for openmpi/3.1.6 with gcc/8.2.0 in umich cluster
ifeq ($(HOSTNAME),gl-login2.arc-ts.umich.edu)
  MPIHOME=/sw/pkgs/arc/stacks/gcc/8.2.0/openmpi/3.1.6/
  mpi_include_dir = $(MPIHOME)/include
  mpi_lib_dir = $(MPIHOME)/lib
  mpi_libraries += -lmpi


  FC = $(MPIHOME)/bin/mpifort
  F90 = $(MPIHOME)/bin/mpifort
  CC = $(MPIHOME)/bin/mpicc
  CXX = $(MPIHOME)/bin/mpicxx

endif

#JC for intel 2022 impi2021
#gl-login3.arc-ts.umich.edu
ifeq ($(HOSTNAME),gl-login3.arc-ts.umich.edu)
  F90 := mpiifort
  FC := mpiifort
  fC := mpiifort
endif

#JC for Gfortran mpich
MPIHOME=/home/wenhua/mpich-install
mpi_include_dir =$(MPIHOME)/include
mpi_lib_dir = $(MPIHOME)/lib
mpi_libraries += -lmpich

FC = $(MPIHOME)/bin/mpifort
F90 = $(MPIHOME)/bin/mpifort
CC = $(MPIHOME)/bin/mpicc
CXX = $(MPIHOME)/bin/mpicxx
