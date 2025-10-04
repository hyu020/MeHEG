#Sample codes for using 'MeHEG' tool to evaluate the epigenetic heterogeneity by using the methylation array profile.
#install the 'MeHEG' package from the GitHub

library(devtools)

devtools::install_github("hyu020/MeHEG")

#Calculate the MeHEG scores

library(MeHEG) #loading the package

data(data.shen2021,package="MeHEG") #loading the sample dataset

head(data.shen2021) #preparing the user-defined dataset as the sample dataset shows

MeHEG.scores <- calMeHEG(data.shen2021) #calculate the MeHEG scores with the 'calMeHEG' function by using the dataframe of methylation array profile

MeHEG.scores #output of MeHEG scores
