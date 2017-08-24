d <- readRDS("./rds/Freichel.rds")


a <- grep("ATII",colnames(d))


#plot(d[,a==TRUE], d[,a=TRUE], log='xy')      #would plot one sample against another
#par(mfrow=c(length(a),length(a)))


#quality control via clusterization

hc <- hclust(dist(t(log(1+d[1:10,-1]))))

png('./Figures/rplot.png',width = 30, height = 20, units = "cm", res=90)

plot(hc)

dev.off()



#dev.off()
#cor(log(1+d[-1]))