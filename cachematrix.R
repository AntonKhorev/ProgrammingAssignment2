## Cached matrix inverse
##
## Example:
## m=matrix(1:4,2,2)
## mc=makeCacheMatrix(m)
## cacheSolve(mc) # returns the inverse of m

## Makes a 'cache matrix' object with the matrix x
makeCacheMatrix <- function(x = matrix()) {
	xSolve=NULL
	list(
		set=function(x1) {
			x<<-x1
			xSolve<<-NULL
		},
		get=function() {
			x
		},
		solve=function() {
			if (is.null(xSolve)) {
				message('cache miss')
				xSolve<<-solve(x)
			} else {
				message('cache hit')
			}
			xSolve
		}
	)
}

## Returns the inverse of the 'cache matrix' object x
## Calculates the inverse only on the first call
cacheSolve <- function(x, ...) {
	x$solve()
}
## I'm going to ignore extra arguments (...) because passing them to solve() may lead to unexpected results.
## Example for original makeVector/cachemean functions:
## x=makeVector(c(1,2,3,NA))
## y=makeVector(c(1,2,3,NA)) # identical vectors
## cachemean(y,na.rm=T) # returns 2
## cachemean(x) # returns NA
## cachemean(y) # returns 2 - same vector, same call, different result
