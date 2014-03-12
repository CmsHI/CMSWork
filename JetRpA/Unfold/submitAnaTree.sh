
cd /afs/cern.ch/work/y/ymao/CMSSW_6_2_0_pre7/src 
#cmsenv
eval `scramv1 runtime -sh`

cd /afs/cern.ch/work/y/ymao/CMSSW_6_2_0_pre7/src 



  echo "root -l -b -q analyzeTreesPA.C++"
  echo "First = $FIRST and last file = $LAST"   

root -b > runAnaTree${FIRST}.log <<EOF
.L analyzeTreesPA.C+
analyzeTreesPA(1, 0, 0, 1, 1, 0, 0, -1, false, 0)
.q
EOF



echo "Done all jobs!"

#echo "Copying output files to " $destination
