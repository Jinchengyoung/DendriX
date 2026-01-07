

DendriX is an open-source, high-performance scientific software platform for simulating two-dimensional and three-dimensional dendritic growth governed by strongly coupled nonlinear multiphysics equations. The software is designed with scalability, extensibility, and maintainability in mind and is particularly suited for large-scale phase-field simulations requiring adaptive resolution and parallel computing.

DendriX is released under a copyleft license (GPL-3.0) to ensure that derivative works and improvements remain openly available to the community.

**Key Features:**
- Block-structured adaptive mesh refinement (AMR) for efficient multiscale resolution
- Finite volume discretization with fully implicit time integration
- Hybrid MPI–OpenMP parallelization for scalable 2D and 3D simulations
- Modular, input-driven software architecture
- Support for multiple numerical solution strategies
- Compatible with common visualization tools (e.g., ParaView, VisIt)

**Software Architecture:**
DendriX is built on a modular design that separates core data structures, numerical solvers, and physics modules. The software integrates:
AMR-based mesh management
- Phase-field, species transport, and charge conservation solvers
- Parallel execution via MPI and shared-memory acceleration via OpenMP
This design enables straightforward extension to additional physics or multiscale coupling.

**Installation:**
**Prerequisites**
- Linux-based operating system (recommended)
- GNU Fortran or Intel Fortran compiler
- MPI library (e.g., OpenMPI or MPICH)
- OpenMP-enabled compile

**Build Instructions:**
git clone https://github.com/<username>/DendriX.git
cd DendriX
make

**To enable MPI:**
make OMP=true

**Usage:**
DendriX is configured entirely through input files.
- Select 2D or 3D simulations via input parameters
- Choose between serial or parallel execution
- Control AMR behavior, numerical schemes, and output options
**Example (MPI execution):**
  mpirun -np 8 ./dendrix input_3d
Output files can be visualized using ParaView or VisIt.

**Validation and Performance:**
DendriX has been validated against representative experimental data and benchmarked against commercial multiphysics software. Results demonstrate improved computational efficiency, particularly for three-dimensional simulations using adaptive mesh refinement and parallel execution.

Details are provided in the accompanying SoftwareX publication.

**Reuse and Extension:**
DendriX is designed as a general-purpose phase-field and multiphysics simulation framework. Users may:
- Implement new phase-field models
- Couple additional physics (e.g., mechanics, thermal transport)
- Integrate system-level or multiscale models
The GPL-3.0 license ensures that extensions remain open and benefit the broader community.
