setwd("~/Downloads/Coursera/RProgramming/week2")
#getwd()
#list.files()

pollutantmean <- function(directory, pollutant, id = 1:332) {
        
        # set working directory
        if(grep("specdata", directory) == 1) {
                directory <- ("./specdata/")
        }
        
        # initialize a vector to hold the pollutant data
        mean_vector <- c()
        
        # find character for all files in the specdata folder
        all_files <- as.character( list.files(directory) )
        
        # find paths for all files in the specdata folder
        file_paths <- paste(directory, all_files, sep="")
        
        
        for(i in id) {
                current_file <- read.csv(file_paths[i], header=T, sep=",")
        # first lines 
                head(current_file)
                
        # 2nd argument 
                pollutant
                
        # find the availale variables (column)
                na_removed <- current_file[!is.na(current_file[, pollutant]), pollutant]
                
        # add every i into total 
                mean_vector <- c(mean_vector, na_removed)
        }
        
        # total
        result <- mean(mean_vector)
        
        # rounding of numbers
        return(round(result, 3)) 
}
