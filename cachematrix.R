## This set of functions is used to assing a set of methods (set, get, setsolve, and getsolve) together with an input matrix
## to an object.

## This functions takes a matrix as an argument and attaches the list of methods, outputting an object
## that includes the matrix and it's methods.
makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) m <<- solve
        getsolve <- function() m
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}

## This function calls the methods in the above function to calculate, save, and return the inverse of the original matrix.
cacheSolve <- function(x, ...) {
        m <- x$getsolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m
}
