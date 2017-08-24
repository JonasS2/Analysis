strsplit(names(d)[1],split = "_")
[[1]]
[1] "gene" "id"  

> strsplit(names(d)[2],split = "_")
[[1]]
[1] "ATII.26" ""        "E01"     "p"       "S1"      "L001"   

> pste(strsplit(names(d)[1],split = "_"))
Error: could not find function "pste"
> paste(strsplit(names(d)[1],split = "_"))
[1] "c(\"gene\", \"id\")"
> paste(strsplit(names(d)[1],split = "_")[[1]])
[1] "gene" "id"  
> paste(strsplit(names(d)[2],split = "_")[[1]])
[1] "ATII.26" ""        "E01"     "p"       "S1"      "L001"   
> paste(strsplit(names(d)[2],split = "_")[[1]], collapse="__")
[1] "ATII.26____E01__p__S1__L001"
> paste(strsplit(names(d)[2],split = "_")[[1]], collapse="_")
[1] "ATII.26__E01_p_S1_L001"
> paste(strsplit(names(d)[2],split = "_")[[1]][1:4], collapse="_")
[1] "ATII.26__E01_p"
merge()


tmp <- grep("ATII", d,value = TRUE) # get values of grep

f[[16]][3]


###################### own stuff



View(own_sample_sheet)
> d <- own_sample_sheet$namework
> grep(ATII,d)
Error in grep(ATII, d) : object 'ATII' not found
> grep(d,ATII)
Error in grep(d, ATII) : object 'ATII' not found
> ?grep
> tmp <- grep("ATII", d)
> tmp
[1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16
> tmp2 <- names(tmp)
> tmp2
NULL
> tmp <- names(grep("ATII", d))
> tmp
NULL
> View(sample_sheet)
> View(own_sample_sheet)
> ?grep
> tmp <- grep("ATII", d,value = TRUE)
> tmp