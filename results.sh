#!/bin/bash
cd "${0%/*}"
cd evo/data


evo_traj kitti KITTI_00_ORB.txt KITTI_00_SPTAM.txt --ref=KITTI_00_gt.txt -p --plot_mode=xz
evo_ape kitti KITTI_00_gt.txt KITTI_00_ORB.txt -va --plot --plot_mode xz --save_results results/ORB_ape.zip
evo_rpe kitti KITTI_00_gt.txt KITTI_00_ORB.txt -va --plot --plot_mode xz --save_results results/ORB_rpe.zip
evo_rpe kitti KITTI_00_gt.txt KITTI_00_SPTAM.txt -va --plot --plot_mode xz --save_results results/SPTAM_rpe.zip
evo_ape kitti KITTI_00_gt.txt KITTI_00_SPTAM.txt -va --plot --plot_mode xz --save_results results/SPTAM_ape.zip
evo_res results/ORB_rpe.zip results/SPTAM_rpe.zip -p --save_table results/table_rpe.csv
evo_res results/ORB_ape.zip results/SPTAM_ape.zip -p --save_table results/table_ape.csv
