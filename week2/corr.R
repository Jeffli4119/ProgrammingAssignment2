setwd("~/Downloads/Coursera/RProgramming/week2")
#getwd()
#list.files()

corr <- function(directory, threshold = 0) {
      
        if(grep("specdata", directory) == 1) {
                directory <- ("./specdata/")
        }
        
        
        # get the complete table
        complete_table <- complete("specdata", 1:332)
        
        nobs <- complete_table$nobs
        
        # find the valid ids
        ids <- complete_table$id[nobs > threshold]
        # get the length of ids vector
        len <- length(ids)
        # get a void frame
        corr <- rep(0, len)
        
        
        # find all files in the specdata folder
        all <- as.character( list.files(directory) )
        path <- paste(directory, all, sep="")
        j <- 1
        for(i in ids) {
                # read every file
                current <- read.csv(path[i], header=T, sep=",")
                # make correlation for every file and save
                corr[j] <- cor(current$sulfate, current$nitrate, use="complete.obs")
                j <- j + 1
        }
        result <- corr
        return(result)   
}