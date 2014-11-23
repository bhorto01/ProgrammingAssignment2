## The functions below will cache the inverse of a matrixPut comments here that give an overall description of what your


## The first function, makeCacheMatrix, will create a matrix object that can cache it's inverse

makeCacheMatrix <- function(x = matrix()) {
    mi <- NULL 
    
    set <- function(y) {
      x <<-y
      mi <<- NULL
    }
    
    get <- function() {x}  
    setinverse <- function(solve) {mi <<- solve}
    getinverse <- function() {mi}
    
    list(set=set, get = get,
         setinverse = setinverse, 
         getinverse = getinverse)
}


## This second function will then compute the inverse of the matrix returned from "makeCacheMatrix". In the event
##that the matrix has not changed and the inverse matrix has not changed, this function should then retreive the
##inverse from the cache

cacheSolve <- function(x, ...) {
        mi <- x$getinverse() 
  if(!is.null(mi)) {
    message("getting cached data") 
    
    return(mi)                    
}
  data <- x$get() 
  mi <- solve(data, ...) 
  x$setinverse(mi) 
  
  mi  
}
