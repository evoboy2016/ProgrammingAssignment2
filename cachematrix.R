## Creating a matrix and setting it in global environment.  
makeCacheMatrix <- function(x = matrix()) {
inv <- NULL
set <- function(y){
  x <<- y
  inv <<- NULL
}
  
get <- function() x
setinverse <- function(inverse) inv <<- inverse
getinverse <- function() inv
list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## Create matrix from the makecachematrix function above. If inverse already calculated,
## then, retrieve the inverse from the cache

cacheSolve <- function(x, ...) {
inv <- x$getinverse()
if(!is.null(inv)){
  message("Getting Cached Data")  ##informing that it is cached inverse matrix
  return(inv)
}
mat <- x$get()
inv <-solve(mat,...)
x$setinverse(inv)
}
