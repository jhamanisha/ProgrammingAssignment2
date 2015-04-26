# Working Example:
# Take a variable 'y' and assign a square matrix to it.
> y <- matrix(c(1, 2, 3, 4), nrow = 2, ncol = 2, byrow = TRUE)

# Print y to check its values
> y
     [,1] [,2]
[1,]    1    2
[2,]    3    4

# Now call the 'makeCacheMatrix' function by passing the above variable 'y' to it, and store the result in another variable called 'p'
> p <- makeCacheMatrix(y)

# Print p to check its values. It should provide the user with all the operations available
> p

$setMatrix
function (y) 
{
    x <- y
    cache <- NULL
}
<environment: 0x0000000027a27b60>

$getMatrix
function () 
{
    x
}
<environment: 0x0000000027a27b60>

$cacheInverseMatrix
function (x) 
{
    cache <- solve(x)
}
<environment: 0x0000000027a27b60>

$getCacheInverseMatrix
function () 
{
    cache
}
<environment: 0x0000000027a27b60>

# Now call the getMatrix sub-function of makeCacheMatrix function
> p$getMatrix()

     [,1] [,2]
[1,]    1    2
[2,]    3    4

# Now call the second function 'cacheSolve' that will calculate the inverse of the example matrix using function 'makeCacheMatrix'.
> cacheSolve(p)

     [,1] [,2]
[1,] -2.0  1.0
[2,]  1.5 -0.5

# To check if the values have been calculated correctly, compare the result by directly inverting the example matrix
> solve(y)

     [,1] [,2]
[1,] -2.0  1.0
[2,]  1.5 -0.5
