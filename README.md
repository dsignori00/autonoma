# autonoma

MATLAB analysis tools for A2RL Autonoma simulator logs.

## What this repository contains

This project provides MATLAB scripts to:
- compare ego vs opponent laps and trajectories
- compute lap times and lap-time progression
- inspect telemetry-based opponent data
- analyze target-tracking signals

Main entry scripts are in `src/`:
- `OpponentComparison.m`
- `LapTimeAnalysis.m`
- `OpponentComparisonTelemetry.m`
- `TargetTrackingAnalysis.m`

## Requirements

- MATLAB (project-based workflow)
- Access to `.mat` log files from simulator runs
- Track database files (already provided in `src/databases`)
- `MATLAB-graphic-tools` submodule checked out (used by project paths)
- For `OpponentComparison.m`: CasADi MATLAB package on MATLAB path (`import casadi.*`)

## Repository structure

- `Autonoma.prj` MATLAB project file
- `src/` analysis scripts
- `src/func/` helper functions
- `src/constants/` constants and plotting style
- `src/databases/` track database `.mat` files
- `src/opponents/indexes.csv` opponent-name mapping
- `bags/` input logs folder (you may need to create it locally)
- `src/mat/` generated processed/best-lap data

## Setup (startup as MATLAB project)

1. Clone the repository.
2. Initialize submodules:
   - `git submodule update --init --recursive`
3. Create the bags folder if it does not exist:
   - `bags/`
4. Open MATLAB and open the project:
   - double-click `Autonoma.prj`, or run:
   - `openProject('Autonoma.prj')` (from repository root), or
   - `openProject('<path-to-repository>/Autonoma.prj')`

Opening the project is important because scripts use `currentProject` (for example in `get_bags_path.m`) and rely on project paths.

## Input data

Place simulator log `.mat` files in:
- `bags/`

When you run scripts, file selectors (`uigetfile`) will ask you to choose logs.

Opponent naming in `OpponentComparison.m` uses:
- `src/opponents/indexes.csv`

If your bag name is not listed there, update that CSV accordingly.

## How to run

After opening the MATLAB project:

1. Go to `src` in MATLAB Current Folder (optional but recommended).
2. Run one of the entry scripts:
   - `OpponentComparison`
   - `LapTimeAnalysis`
   - `OpponentComparisonTelemetry`
   - `TargetTrackingAnalysis`
3. Follow prompts to select database/log files when requested.

### Typical workflow: OpponentComparison

1. Run `OpponentComparison`.
2. Select a track database from `src/databases` when prompted.
3. Select opponent/ego logs from `bags`.
4. Review generated figures:
   - Trajectory
   - Speed Profile
   - Acceleration Profile
   - GG Plot
5. Optional: set script flags (`multi_run`, `ego_vs_ego`, `save_v2v`, `splitted_bag`) before running.

## Notes

- Processed outputs can be saved in logs folder (`*_processed.mat`) when `save_v2v = true`.
- Best-lap processed data are cached in `src/mat`.
- If `currentProject` errors appear, reopen the project (`Autonoma.prj`) and rerun.
