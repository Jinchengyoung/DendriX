\# DendriX



\*\*DendriX\*\* is an open-source, high-performance scientific software platform for

large-scale \*\*two-dimensional (2D) and three-dimensional (3D) phase-field

simulations\*\* governed by strongly coupled nonlinear multiphysics equations.

The software is designed with \*\*scalability, extensibility, and maintainability\*\*

in mind and is particularly suited for simulations requiring \*\*adaptive mesh

refinement\*\* and \*\*parallel computing\*\*.



DendriX is released under a \*\*copyleft license (GPL-3.0)\*\* to ensure that

derivative works and future extensions remain openly available to the community.



---



\## Key Features



\- \*\*Phase-field modeling\*\* for interfacial and microstructural evolution

\- \*\*Block-structured adaptive mesh refinement (AMR)\*\* for efficient multiscale resolution

\- \*\*Finite volume discretization\*\* with fully implicit time integration

\- \*\*Hybrid MPI–OpenMP parallelization\*\* for scalable 2D and 3D simulations

\- Modular, input-driven software architecture

\- Support for multiple numerical solution strategies

\- Output compatible with common visualization tools (e.g., ParaView, VisIt)



---



\## Software Architecture



DendriX follows a modular software design that separates:



\- Core data structures and AMR mesh management  

\- Numerical solvers for phase-field, species transport, and charge conservation  

\- Parallel execution layers (MPI for distributed memory, OpenMP for shared memory)



This architecture enables straightforward extension to additional physics

modules (e.g., mechanics, thermal transport) or multiscale coupling with

system-level models.



---



\## Installation



\### Prerequisites



\- Linux-based operating system (recommended for HPC usage)

\- GNU Fortran or Intel Fortran compiler

\- MPI library (e.g., OpenMPI or MPICH)

\- OpenMP-enabled compiler



\### Build Instructions



Clone the repository:



```bash

git clone https://github.com/Jinchengyoung/DendriX.git

cd DendriX

