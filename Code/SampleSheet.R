sample_sheet <- read.csv("./Sample Sheets and comparisons/RNAseq_DZHK_H№bner_Overview_KALKA_04072017_mod-JECL.csv.csv")

own_sample_sheet <- sample_sheet <- data.frame(row.names = sample_sheet$Sample)

tmp <- sample_sheet$Info.treatment.group

sample_sheet["Info_treatment_group"] <- tmp #add column

data_names <- colnames(count_table) #extract names from count frame order is the same

own_sample_sheet["data_Names"] <- data_names[-1]

own_sample_sheet <- own_sample_sheet[c("data_Names", "Info_treatment_group")] #just change order

###########

# construct useful names step by step for ATII, Iso and TAC
test <- own_sample_sheet[1:16,3]

f <- strsplit(as.character(test),split = "_")


i <- as.character(own_sample_sheet[1:16,2])

c=1
for (c in 1:16)
{i[c] <- paste(i[c], f[[c]][3])}
ATII <- i

grep("Iso",own_sample_sheet$namework)

test <- own_sample_sheet[17:48,3]

f <- strsplit(as.character(test),split = "_")


i <- as.character(own_sample_sheet[17:48,2])

c=1
for (c in 1:32)
{i[c] <- paste(i[c], f[[c]][5],f[[c]][6])}
Iso <- i


grep("TAC",own_sample_sheet$namework)

test <- own_sample_sheet[49:96,3]

f <- strsplit(as.character(test),split = "_")


i <- as.character(own_sample_sheet[49:96,2])

c=1
for (c in 1:48)
{i[c] <- paste(i[c], f[[c]][2])}
TAC <- i

own_sample_sheet[4] <- ATII
own_sample_sheet[17:48,4] <- Iso
own_sample_sheet[49:96,4] <- TAC


