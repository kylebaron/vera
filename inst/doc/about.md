
# vera

## User Stories

1. I have a model written in mrgsolve and I wish to do local sensitivity 
   analysis on selected parameters and outputs.
1. I would like to plot the sensitivity analysis.
   
## Summary of requirements

1. The user will build and load a model using mrgsolve. 
1. The user will create a function taking a list of parameters as the first
   argument along with other arguments passed by `...` and return data
   simulated from the model.
1. The user will specify names of parameters and outputs for sensitivity 
   analyses.
1. The sensitivity analysis function will return a long data frame with the 
   following columns: `time` (or `TIME`), `var`, the name of the the output;
   `value` the simulated value for `var`, `par`, the name of the parameter; 
   and `sens`, the value of the sensitivity equation.
1. A plot method will use ggplot2 to create a plot of `sens` versus
   `time`, grouped and colored by `par` and faceted by `var`.

# Coverage
See [inst/covr/coverage.md](../covr/coverage.md)



