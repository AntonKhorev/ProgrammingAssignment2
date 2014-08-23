## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
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

## Write a short comment describing this function
# I'm going to ignore extra arguments
# example for original makeVector/cachemean functions
# x=makeVector(c(1,2,3,NA))
# y=makeVector(c(1,2,3,NA)) # identical vectors
# cachemean(y,na.rm=T) # returns 2
# cachemean(x) # returns NA
# cachemean(y) # returns 2 - same vector, same call, different result
cacheSolve <- function(x, ...) {
	x$solve()
}
