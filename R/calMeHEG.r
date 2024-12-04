##calculate different versions of MeHEG
calMeHEG <- function(x) {
data <- x
library(matrixStats)
#coef6s7
mydata<-data.frame(data[row.names(coef6s7),])
mydeconv<-data.frame(matrix(nrow=ncol(mydata),ncol=0))
for (i in 1:ncol(coef6s7)) {
mydata2 <- mydata*coef6s7[,i]
mydeconv[,colnames(coef6s7)[i]] <- colSums(mydata2, na.rm = TRUE)
}
row.names(mydeconv) <- colnames(mydata)
mydeconv$MeHEG.g6s7 <- rowSds(as.matrix(mydeconv),na.rm = TRUE)
mydeconv$MeHEG.g6s7m <- mydeconv$MeHEG.g6s7/rowMeans(as.matrix(mydeconv[,-ncol(mydeconv)]),na.rm = TRUE)
mydeconvolution <- mydeconv[row.names(mydeconvolution),"MeHEG.g6s7m"]
return(mydeconvolution)
}#over

