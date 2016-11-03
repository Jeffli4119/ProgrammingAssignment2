setwd("~/Downloads/Coursera/RProgramming/week2")
#getwd()
#list.files()

complete <- function(directory, id=1:332) {
        
        
        # set work directroy 
        if(grep("specdata", directory) == 1) {
                directory <- ("./specdata/")
        }
        # get the length of id vector 1
        len <- length(id)
        
        # get void frame 0 
        complete <- rep(0, len)
        
        # find all files in the specdata folder
        all <- as.character( list.files(directory) )
        
        # find path for every file
        path <- paste(directory, all, sep="")
        
        
        j <- 1 
        for (i in id) {
                # read every file 
                current <- read.csv(path[i], header=T, sep=",")
                # output every observed cases
                complete[j] <- sum(complete.cases(current))
                j <- j + 1
        }
        result <- data.frame(id = id, nobs = complete)
        return(result)
} 