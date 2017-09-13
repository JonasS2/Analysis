sample_sheet <- read.csv("./Sample Sheets and comparisons/RNAseq_DZHK_H№bner_Overview_KALKA_04072017_mod-JECL.csv")
count_table <- readRDS("rds/Freichel.rds")

#own_sample_sheet <- sample_sheet <- data.frame(row.names = sample_sheet$Sample)

own_sample_sheet <-data.frame(row.names = sample_sheet$Sample)

tmp <- sample_sheet$Info.treatment.group

own_sample_sheet["Info_treatment_group"] <- tmp #add column

data_names <- colnames(count_table) #extract names from count frame order is the same

own_sample_sheet["data_Names"] <- data_names[-1]

own_sample_sheet <- own_sample_sheet[c("data_Names", "Info_treatment_group")] #just change order

###########

# construct useful names step by step for ATII, Iso and TAC
test <- sample_sheet[1:16,6]

f <- strsplit(as.character(test),split = "_")


i <- as.character(own_sample_sheet[1:16,2])

c=1
for (c in 1:16)
{
  i[c] <- paste(i[c], f[[c]][3],f[[c]][4])
}
ATII <- i

grep("Iso",own_sample_sheet$namework)

test <- sample_sheet[17:48,6]

f <- strsplit(as.character(test),split = "_")


i <- as.character(own_sample_sheet[17:48,2])


c = 1
for (c in 1:32)
{
  i[c] <- paste(i[c], f[[c]][5], f[[c]][6])
}
Iso <- i


grep("TAC",own_sample_sheet$namework)

test <- sample_sheet[49:96,6]

f <- strsplit(as.character(test),split = "_")


i <- as.character(own_sample_sheet[49:96,2])

c=1
for (c in 1:48)
{
  i[c] <- paste(i[c], f[[c]][2], f[[c]][3])
}
TAC <- i

own_sample_sheet[3] <- ATII
own_sample_sheet[17:48,3] <- Iso
own_sample_sheet[49:96,3] <- TAC

######### new version
own_sample_sheet$Genotype <- "NA"
own_sample_sheet$Genotype[grepl("Stim1",own_sample_sheet$Info_treatment_group)] <- "Stim1/2_control"
own_sample_sheet$Genotype[grepl("Wu4",own_sample_sheet$Info_treatment_group)] <- "Wu4_control"
own_sample_sheet$Genotype[grepl("WT",own_sample_sheet$Info_treatment_group)] <- "WT"
own_sample_sheet$Genotype[grepl("Stim1.+KO",own_sample_sheet$Info_treatment_group)] <- "Stim1/2_KO"
own_sample_sheet$Genotype[grepl("Wu4.+KO",own_sample_sheet$Info_treatment_group)] <- "Wu4_KO"
own_sample_sheet$Genotype[grepl("TRPC1.+KO",own_sample_sheet$Info_treatment_group)] <- "TRPC_KO"

own_sample_sheet$Treatment <- "NA"
own_sample_sheet$Treatment[grepl("saline",own_sample_sheet$Info_treatment_group)] <- "saline"
own_sample_sheet$Treatment[grepl("Isoproterenol",own_sample_sheet$Info_treatment_group)] <- "Isoproterenol"
own_sample_sheet$Treatment[grepl("Angiotensin",own_sample_sheet$Info_treatment_group)] <- "Angiotensin"
own_sample_sheet$Treatment[grepl("sham",own_sample_sheet$Info_treatment_group)] <- "sham"
own_sample_sheet$Treatment[grepl("TAC",own_sample_sheet$Info_treatment_group)] <- "TAC_48_hours"
own_sample_sheet$Treatment[grepl("TAC.+day",own_sample_sheet$Info_treatment_group)] <- "TAC_(7_days)"

own_sample_sheet$p_t <- "NA"
own_sample_sheet$p_t[grepl("p",own_sample_sheet$V3)] <- "p"
own_sample_sheet$p_t[grepl(" t",own_sample_sheet$V3)] <- "t"

################################

saveRDS(own_sample_sheet,"./rds/own_sample_sheet.rds")




