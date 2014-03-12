#!/bin/bash
cd /afs/cern.ch/work/y/ymao/CMSSW_6_2_0_pre7/src
#cmsenv
eval `scramv1 runtime -sh`

cd /afs/cern.ch/work/y/ymao/CMSSW_6_2_0_pre7/src

nJobs=20 
i=0
while [ $i -le $nJobs ];
do 
   let "start=i*500"
   let "end=(i+1)*500"
  export FIRST=$start  
  export LAST=$end 
  echo "First = $FIRST and last file = $LAST"   
  bsub -R "pool>5000" -M 3000000 -q 8nh -J anaTree_${i} < /afs/cern.ch/work/y/ymao/CMSSW_6_2_0_pre7/src/submitAnaTree.sh
  let "i++"
done





echo "submit all jobs!"

#echo "Copying output files to " $destination
