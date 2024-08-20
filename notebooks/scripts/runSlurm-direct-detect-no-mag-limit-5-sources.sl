#!/bin/bash -l
#SBATCH --partition milano
#SBATCH --account rubin:developers
#SBATCH --nodes 1
#SBATCH --mem=200G
#SBATCH --cpus-per-task=18
#SBATCH -t 10:00:00
#SBATCH --job-name comcam_timing_direct-detect-pipeline
#SBATCH --output=/sdf/home/b/brycek/u/aos-repos/sitcomtn-135/notebooks/scripts/direct-detect-pipeline.out
echo "starting at `date` on `hostname`"
pwd
source /sdf/home/b/brycek/setup_aos.sh
cd /sdf/home/b/brycek/u/aos-repos/sitcomtn-135/notebooks/scripts/
pipetask run -b /sdf/group/rubin/repo/aos_imsim/ -i refcats,LSSTComCamSim/raw/all,LSSTComCamSim/calib/unbounded --instrument lsst.obs.lsst.LsstComCamSim --register-dataset-types -o sitcomtn-135/directDetectTimingTest_SourceLimit5 -p science_direct_detect_no_mag_limit_5_sources.yaml -d "detector IN (0..9) AND instrument='LSSTComCamSim' and visit IN (7024072600012, 7024072600010)" -j 18
echo "ended at `date` on `hostname`"
