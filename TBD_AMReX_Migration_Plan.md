# TBD: DendriX Migration Plan (BoxLib -> AMReX)

Status: Planned (for SoftwareX post-publication maintenance and portability roadmap)
Date: 2026-02-17
Scope: `work/Dendrite_PFcode` (Fortran solver currently using BoxLib-era infrastructure)

## 1. Objectives

1. Replace deprecated BoxLib dependency with actively maintained AMReX.
2. Preserve validated physics behavior during migration.
3. Establish a clear path to modern CPU performance and future GPU portability.

## 2. Guiding Constraints

1. No physics-model changes in early migration phases.
2. Keep runnable checkpoints after each phase.
3. Validate numerics against BoxLib baseline before advancing.

## 3. Phased Upgrade Plan

## Phase A - Baseline Freeze and Reproducibility

Deliverables:
1. Tag a BoxLib baseline branch and archive reference outputs for selected 2D/3D cases.
2. Define regression metrics:
   - dendrite tip position/velocity
   - morphology descriptors
   - effective conductivity / short-detection signals (if enabled)
3. Record build matrix (compiler, MPI, flags, test inputs).

Exit criteria:
1. Reproducible baseline outputs and comparison scripts are available.

## Phase B - Build System Transition

Deliverables:
1. Introduce AMReX as dependency (submodule or external package path).
2. Add AMReX build target while keeping legacy target temporarily.
3. Document dependency setup and compile instructions.

Exit criteria:
1. Code compiles and runs with AMReX-backed build path for at least one 2D case.

## Phase C - Core Data/Runtime API Migration

Deliverables:
1. Replace BoxLib initialization/finalization calls with AMReX equivalents.
2. Migrate MultiFab/layout and ghost-fill pathways module-by-module:
   - `main.f90`
   - `pf_utility.f90`
   - `phase_field.f90`
   - `solute_field.f90`
   - `init_phi.f90`
   - `potential_field.f90`
3. Preserve existing numerical kernels as much as possible.

Exit criteria:
1. 2D and 3D reference cases run end-to-end with AMReX path.

## Phase D - Linear Solvers and AMR Services

Deliverables:
1. Replace or wrap BoxLib-specific MG/solver interfaces with AMReX linear solver stack.
2. Migrate AMR/regridding utilities and BC handling:
   - restriction/prolongation
   - fillpatch/ghost exchange
   - tagging/regrid triggers

Exit criteria:
1. Solver convergence and AMR behavior are stable on baseline tests.

## Phase E - Verification, Performance, and Release

Deliverables:
1. Side-by-side validation report (BoxLib baseline vs AMReX):
   - quantitative error bands
   - runtime/memory comparisons
2. CI or scripted regression workflow for core test cases.
3. User-facing migration notes and deprecation notice for legacy build.

Exit criteria:
1. AMReX path declared default; legacy BoxLib path archived.

## Phase F - Future GPU Portability (Optional)

Note:
1. If direct Fortran interface paths are insufficient for target GPU performance, add a staged C++ driver and port hotspot kernels incrementally.
2. This phase is not required to answer current reviewer concerns but is a long-term scalability path.

## 4. Risk Register (High-Level)

1. API incompatibilities in legacy Fortran wrappers.
   Mitigation: module-by-module migration with temporary adapters.
2. Numerical drift due to solver differences.
   Mitigation: strict regression metrics and tolerance gates.
3. Build complexity during dual-support period.
   Mitigation: short overlap window and clear deprecation schedule.

## 5. Proposed Timeline (Paper-Relevant)

1. Month 0-1: Phase A-B
2. Month 2-4: Phase C
3. Month 4-6: Phase D-E
4. Beyond Month 6: optional Phase F

## 6. Paper/Rebuttal Positioning

1. Current published results remain valid on the current code base.
2. Migration to AMReX is a planned software-engineering modernization for maintainability, portability, and long-term performance.
3. This plan is tracked as a repository TBD item and will be updated with implementation milestones.
