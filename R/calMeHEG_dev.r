##calculate different versions of MeHEG
calMeHEG_dev <- function(x) {
data <- x
library(matrixStats)
#coef30
mydata<-data.frame(data[row.names(coef30),])
mydeconv<-data.frame(matrix(nrow=ncol(mydata),ncol=0))
for (i in 1:ncol(coef30)) {
mydata2 <- mydata*coef30[,i]
mydeconv[,colnames(coef30)[i]] <- colSums(mydata2, na.rm = TRUE)
}
row.names(mydeconv) <- colnames(mydata)
mydeconv$MeHEG.g30 <- rowSds(as.matrix(mydeconv),na.rm = TRUE)
mydeconv$MeHEG.g30m <- mydeconv$MeHEG.g30/rowMeans(as.matrix(mydeconv[,-ncol(mydeconv)]),na.rm = TRUE)
mydeconvolution <- mydeconv[,c("MeHEG.g30","MeHEG.g30m")]
#coef6
mydata<-data.frame(data[row.names(coef6),])
mydeconv<-data.frame(matrix(nrow=ncol(mydata),ncol=0))
for (i in 1:ncol(coef6)) {
mydata2 <- mydata*coef6[,i]
mydeconv[,colnames(coef6)[i]] <- colSums(mydata2, na.rm = TRUE)
}
row.names(mydeconv) <- colnames(mydata)
mydeconv$MeHEG.g6 <- rowSds(as.matrix(mydeconv),na.rm = TRUE)
mydeconv$MeHEG.g6m <- mydeconv$MeHEG.g6/rowMeans(as.matrix(mydeconv[,-ncol(mydeconv)]),na.rm = TRUE)
mydeconvolution <- cbind(mydeconvolution,mydeconv[row.names(mydeconvolution),c("MeHEG.g6","MeHEG.g6m")])
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
mydeconvolution <- cbind(mydeconvolution,mydeconv[row.names(mydeconvolution),c("MeHEG.g6s7","MeHEG.g6s7m")])
return(mydeconvolution)
}#over

