
rds/Freichel.rds:
	Rscript ./Code/Load.R > ./log/load.log
	
hcluster: rds/Freichel.rds
	Rscript ./Code/hcluster.R > ./log/$@.txt