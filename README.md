

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
- git clone https://github.com/<username>/DendriX.git
- cd DendriX
- make

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

# DendriX

**DendriX** is an open-source scientific software platform for simulating
two-dimensional (2D) and three-dimensional (3D) lithium dendrite growth in
Li-ion batteries using a phase-field–based multiphysics framework.
The software integrates **adaptive mesh refinement (AMR)**, **finite volume
discretization**, **implicit solvers**, and **hybrid MPI–OpenMP parallelization**
to efficiently solve strongly coupled nonlinear governing equations.

DendriX is designed as a flexible, maintainable, and extendable alternative
to commercial multiphysics software such as COMSOL and MOOSE, with a particular
strength in scalable 3D simulations.

The software is released under the **GNU General Public License v3.0 (GPL-3.0)**.

---

## Quick Start (for Reviewers)

This section provides the minimum steps required to **build, run, and visualize**
a DendriX simulation.

### Prerequisites
- Linux-based system
- GNU Fortran or Intel Fortran compiler
- MPI library (optional, for parallel runs)
- VisIt or ParaView for visualization

### Build
```bash
cd PhaseField/Works/Dendrite_PFcode
make
```

Enable MPI:
```bash
make MPI=t
```

Enable OpenMP (recommended for 3D):
```bash
make OMP=t
```

### Run

Serial (2D example):
```bash
./main.Linux.gfortran.exe Inputs_2d
```

Parallel (3D example):
```bash
mpirun -n 4 ./main.Linux.gfortran.mpi.exe Inputs_3d
```

### Visualize

**VisIt**
1. Open VisIt
2. Load `den00000000/Header`
3. Add *Pseudocolor → phase_field* (2D) or *Contour → phase_field* (3D)
4. Click **Draw**

**ParaView**
1. Open a plotfile directory (e.g., `den00096000`)
2. Select *AMReX / BoxLib Grid Reader*
3. Choose `phase_field` and click **Apply**
4. (3D) Apply *Contour* filter (e.g., isovalue = 0.5)

---

## Software Capabilities

- Simulation of **2D and 3D Li-ion dendrite growth**
- Single-dendrite and multi-dendrite configurations
- **Adaptive mesh refinement (AMR)**
- Multiple numerical solution strategies
- Serial and **MPI/OpenMP parallel execution**
- Visualization using **VisIt** and **ParaView**

---

## Directory Structure

```
PhaseField/
├── Src/
├── Tools/
└── Works/
    └── Dendrite_PFcode/
```

---

## License

This project is licensed under the **GNU General Public License v3.0 (GPL-3.0)**.
See the `LICENSE` file for details.

---

## Citation

If you use DendriX in your research, please cite:

> J. Young et al., *DendriX: A Flexible, Maintainable, and Extendable Platform to
> Simulate 3D Li-Dendrite Growth*, SoftwareX, 2026.

---

## Contact

For questions or issues, please open an issue on GitHub.
