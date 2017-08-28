own_ss <- readRDS("rds/own_sample_sheet.rds")
data <- readRDS("rds/Freichel.rds")
library(DESeq2)

#x <- own_ss$data_Names
#$own_ss[1] <- rownames(own_ss)
#rownames(own_ss) <- x

#ddsMat <- DESeqDataSetFromMatrix(countData = data[2:97], colData = own_ss,design = ~1 )

#rld <- rlog(ddsMat)

##### part above only needed if rld.rds has to be computed

rld <- readRDS("rds/rdl.rds")

png('./Figures/PCA/PCA.png',width = 40, height = 20, units = "cm", res=90)

plotPCA(rld,"Info_treatment_group")

dev.off()




### Subset plots


###Control / KO

png('./Figures/PCA/PCA_Control_KO.png',width = 40, height = 20, units = "cm", res=90)
colData(rld)$Contr <- "Treat"
colData(rld)$Contr[grepl("Contr",colData(rld)$Info_treatment_group)] <- "Contr"

plotPCA(rld,"Contr")

dev.off()

plotPCA(rld,"Contr")

#Stim1 Stim2
o <- grepl("Stim",own_ss$Info_treatment_group)

png('./Figures/PCA/PCA_Stim.png',width = 40, height = 20, units = "cm", res=90)

plotPCA(rld[,o],"Info_treatment_group")

dev.off()

#Stim1 Stim2 saline
o <- grepl("Stim.+saline",own_ss$Info_treatment_group)

png('./Figures/PCA/PCA_Stim_saline.png',width = 40, height = 20, units = "cm", res=90)

plotPCA(rld[,o],"Info_treatment_group")

dev.off()

#Stim1 Stim2 Angiotensin
o <- grepl("Stim.+Ang",own_ss$Info_treatment_group)

png('./Figures/PCA/PCA_Stim_ATII.png',width = 40, height = 20, units = "cm", res=90)

plotPCA(rld[,o],"Info_treatment_group")

dev.off()



#TRPC KO / WT
o <- grepl("TRPC|WT",own_ss$Info_treatment_group)

png('./Figures/PCA/PCA_TRPC.png',width = 40, height = 20, units = "cm", res=90)

plotPCA(rld[,o],"Info_treatment_group")

dev.off()

#TRPC sham
o <- grepl("TRPC.+sham|WT.+sham",own_ss$Info_treatment_group)

png('./Figures/PCA/PCA_TRPC_sham.png',width = 40, height = 20, units = "cm", res=90)

plotPCA(rld[,o],"Info_treatment_group")

dev.off()

#TRPC sham
o <- grepl("TRPC.+TAC|WT.+TAC",own_ss$Info_treatment_group)

png('./Figures/PCA/PCA_TRPC_TAC.png',width = 40, height = 20, units = "cm", res=90)

plotPCA(rld[,o],"Info_treatment_group")

dev.off()

#Wu4
o <- grepl("Wu4",own_ss$Info_treatment_group)

png('./Figures/PCA/PCA_Wu4.png',width = 40, height = 20, units = "cm", res=90)

plotPCA(rld[,o],"Info_treatment_group")

dev.off()


#Wu4 Saline
o <- grepl("Wu4.+saline",own_ss$Info_treatment_group)

png('./Figures/PCA/PCA_Wu4_saline.png',width = 40, height = 20, units = "cm", res=90)

plotPCA(rld[,o],"Info_treatment_group")

dev.off()

#Wu4 Isoproterenol
o <- grepl("Wu4.+Iso",own_ss$Info_treatment_group)

png('./Figures/PCA/PCA_Wu4_Iso.png',width = 40, height = 20, units = "cm", res=90)

plotPCA(rld[,o],"Info_treatment_group")

dev.off()

#Wu4 Sham
o <- grepl("Wu4.+sham",own_ss$Info_treatment_group)

png('./Figures/PCA/PCA_Wu4_sham.png',width = 40, height = 20, units = "cm", res=90)

plotPCA(rld[,o],"Info_treatment_group")

dev.off()

#Wu4 TAC
o <- grepl("Wu4.+TAC",own_ss$Info_treatment_group)

png('./Figures/PCA/PCA_Wu4_TAC.png',width = 40, height = 20, units = "cm", res=90)

plotPCA(rld[,o],"Info_treatment_group")

dev.off()


