library(GGally)
library(ggplot2)    
data(swiss)

# Function to return points and geom_smooth
# allow for the method to be changed
my_fn <- function(data, mapping, method="loess", ...){
  p <- ggplot(data = data, mapping = mapping) + 
    geom_point() + 
    geom_smooth(method=method, ...)
  p
}

# Default loess curve    
ggpairs(swiss[1:4], lower = list(continuous = my_fn))
ggpairs(swiss[1:4], lower = list(continuous = wrap(my_fn, method="lm")))
ggpairs(swiss, lower = list(continuous = wrap(my_fn, method="lm")))



summary(lm(Fertility ~., data = swiss))

my_fn <- function(data, mapping, pts=list(), smt=list(), ...){
  ggplot(data = data, mapping = mapping, ...) + 
    do.call(geom_point, pts) +
    do.call(geom_smooth, smt) 
}

# Plot 
ggpairs(swiss[1:4], 
        lower = list(continuous = 
                       wrap(my_fn,
                            pts=list(size=2, colour="red"), 
                            smt=list(method="lm", se=F, size=5, colour="blue"))))




require(datasets); data(swiss); require(GGally); require(ggplot2)
g = ggpairs(swiss, lower = list(continuous = wrap("smooth", method = "lm")))
g


gp = ggpairs(swiss, lower = list(continuous = "smooth"))
gp
