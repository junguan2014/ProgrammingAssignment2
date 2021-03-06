## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        # init
        cache <- NULL
        
        # store a matrix
        setMatrix <- function(newValue) {
                x <<- newValue
                # flush the cache
                cache <<- NULL
        }

        # returns the stored matrix
        getMatrix <- function() {
                x
        }

        # cache the given argument 
        cacheInverse <- function(solve) {
                cache <<- solve
        }

        # get the cached value
        getInverse <- function() {
                cache
        }
        
        # return a list. Each named element of the list is a function
        list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        # get the cached value
        inverse <- x$getInverse()
        
        # if a cached value exists return it
        if(!is.null(inverse)) {
                return(inverse)
        }
        
        # otherwise get the matrix, caclulate the inverse and store it in the cache
        data <- x$getMatrix()
        inverse <- solve(data)
        x$cacheInverse(inverse)
        
        # return the inverse
        inverse
}
