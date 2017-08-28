
rds/Freichel.rds:
	Rscript ./Code/Load.R > ./log/load.log
	
hcluster: rds/Freichel.rds SampleSheet
	Rscript ./Code/hcluster.R > ./log/$@.txt
	
SampleSheet: rds/Freichel.rds
	Rscript ./Code/SampleSheet.R > ./log/sheet.log
	
Heatmap: SampleSheet
	Rscript ./Code/QC.R > ./log/QC.log
	
PCA: SampleSheet
	Rscript ./Code/PCA.R > ./log/PCA.log