# This function creates a special "matrix" object that can cache its inverse.
# Note this will work with only square matrices
# for example: y <- matrix(c(1, 2, 3, 4), nrow = 2, ncol = 2, byrow = TRUE)

makeCacheMatrix <- function(x = matrix()) 
{
  # set the cache variable as NULL
  cache <- NULL
  
  # assign value to the matrix x
  setMatrix <- function(y)
  {
    x <- y 
    
    # empty cache again
    cache <- NULL
  }
  
  # retrieve the matrix
  getMatrix <- function()
  {
    x
  }
    
  # Inverse the matrix and store it in cache
  cacheInverseMatrix <- function(x)
  {  
    cache <- solve(x)
  }
  
  # retrieve the cache that stores the inverse of the matrix
  getCacheInverseMatrix <- function()
  {
    cache
  }
  
  # return a list of functions to user to choose from
  list(
        setMatrix = setMatrix
        ,getMatrix = getMatrix
        ,cacheInverseMatrix = cacheInverseMatrix
        ,getCacheInverseMatrix = getCacheInverseMatrix
       )
}

############################################################################################################################

  # This function computes the inverse of the special "matrix" returned by function makeCacheMatrix. 
  # If the inverse has already been calculated (and the matrix has not changed), 
  # then the cachesolve should retrieve the inverse from the cache.
  
  cacheSolve <- function(p, ...) 
  {
    # get the cached value from previous function
    inverse <- p$getCacheInverseMatrix()
    
    # in case a cache value already exists get it
    if(!is.null(inverse)) 
    {
      message("getting cached data")
      return(inverse)
    }
    
    # otherwise get the matrix, caclulate the inverse and store it in the cache
    data <- p$getMatrix()
    inverse <- solve(data)
    p$cacheInverseMatrix(inverse)
    
    # return the inverse
    inverse
  }
