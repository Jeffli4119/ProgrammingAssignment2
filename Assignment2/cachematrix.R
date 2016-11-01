## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function 


# define "make matrix" function with matrix x
makeCacheMatrix <- function(x = matrix()) {

# set inverseMatrix(null firstly) to save the inverse values         
        inverseMatrix <- NULL

# set matrix function         
        set <- function(y) {
                x  <<- y
                inverseMatrix  <<- NULL
        }

# get matrix function        
        get <- function() x
        
# set inverse matrix fuction 
        setinverseMatrix <- function(inverse)  inverseMatrix <<- inverse
        
# get inverse matrix function 
        getinverseMatrix <- function() inverseMatrix

# return a list of all four sub-functions        
        list(set = set,
             get = get,
             setinverseMatrix = setinverseMatrix ,
             getinverseMatrix = getinverseMatrix )
}

###################################################
# input the cached matrix 
cacheSolve <- function(x, ...) {
        
# find inverse matrix from cached matrix
        inverseMatrix <- x$getinverseMatrix()

# check if the inverse matrix we already have 
# if have, return that inverse matrix
        if(!is.null(inverseMatrix)) {
                message("getting cached data")
                return(inverseMatrix)
        }

# if not, get the function from x  
        data <- x$get()
        
# get inverse matrix 
        inverseMatrix <- solve(data, ...)

# set/save the inverse matrix for further use      
        x$setinverseMatrix(inverseMatrix )
        
# return results
        inverseMatrix
}