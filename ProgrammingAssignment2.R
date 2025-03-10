## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
inv <- NULL
set <- function(y) {
  x <<- y
  inv <<- NULL
}
get <- function() x #function to get the actual matrix
setinv <- function( inverse ) inv <<- inverse
getinv <- function() {
  inver<-ginv(x)
  inver%*%x }
list(set = set, get = get,
     setinv = setinv,
     getinv = getinv)
}

## Write a short comment describing this function

cacheSolve <- function(x, ...) 
        ## Return a matrix that is the inverse of 'x'
cacheSolve <- function(x, ...)
{
  inv<-x$getinv()
  if(!is.null(inv)){
    message("now getting the cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinv(inv)
  inv
}
