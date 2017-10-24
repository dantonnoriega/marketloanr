
<!-- README.md is generated from README.Rmd. Please edit that file -->
marketloanr
===========

The goal of marketloanr is to ...

Installation
------------

You can install marketloanr from github with:

``` r
# install.packages("devtools")
devtools::install_github("dantonnoriega/marketloanr")
```

Example
-------

This is a basic example which shows you how to solve a common problem:

``` r
# load packages
library(marketloanr)
library(tidyverse)
#> Loading tidyverse: ggplot2
#> Loading tidyverse: tibble
#> Loading tidyverse: tidyr
#> Loading tidyverse: readr
#> Loading tidyverse: purrr
#> Loading tidyverse: dplyr
#> Conflicts with tidy packages ----------------------------------------------
#> filter(): dplyr, stats
#> lag():    dplyr, stats

# load the data
dat <- get_loan_data()

# find vector of rates given score `s`
s = 600
rates <- get_rates(s, as_vec = TRUE) # can get just vector of rates
rates_df <- get_rates(s, as_vec = FALSE) # or get the filtered subset

rates
#>  [1] 13.51 16.01 16.01 15.05 15.83 18.58 15.83 18.58 15.83 18.58 15.83
#> [12] 18.58 15.83 11.79 12.99 13.99 14.29 14.49 14.79 14.79 14.99 15.49
#> [23] 15.79 15.49 15.79 11.99 12.99 12.09 13.09 13.19 13.29 11.99 12.99
#> [34]  5.29  5.79  5.89  5.29  6.29  5.79  7.09  6.49  6.49  5.29  5.79
#> [45] 13.50 13.85 14.25 14.25 13.50 13.85 14.25 14.25 14.25 14.65 15.15
#> [56] 15.40 15.90 15.90 13.50 13.85 14.25 14.25 12.09 13.29 11.38 13.38
#> [67] 13.38 13.38 17.88 14.68 14.78 11.38 13.38 11.38 14.74 14.84 15.99
#> [78] 16.64 16.34 17.34 15.69 16.29 17.04 17.09
rates_df
#> Source: local data frame [84 x 12]
#> Groups: <by row>
#> 
#> # A tibble: 84 x 12
#>                                    name auto_status        program LTV_index LTV_max months_max
#>                                   <chr>       <chr>          <chr>     <chr>   <dbl>      <dbl>
#>  1                    Volkswagen Credit         New       standard      MSRP     100         60
#>  2                    Volkswagen Credit         New       standard      MSRP     100         66
#>  3                    Volkswagen Credit         New       standard      MSRP     100         72
#>  4                    Volkswagen Credit         New        balloon      MSRP      90         48
#>  5                    Volkswagen Credit        Used       standard      KRBB      90         60
#>  6                    Volkswagen Credit        Used       standard      KRBB      90         72
#>  7                    Volkswagen Credit        Used       standard      KRBB      90         60
#>  8                    Volkswagen Credit        Used       standard      KRBB      90         72
#>  9                    Volkswagen Credit        Used       standard      KRBB      90         60
#> 10                    Volkswagen Credit        Used       standard      KRBB      90         72
#> 11                    Volkswagen Credit        Used       standard      KRBB      90         60
#> 12                    Volkswagen Credit        Used       standard      KRBB      90         72
#> 13                    Volkswagen Credit        Used       standard      KRBB      90         60
#> 14          Wells Fargo Dealer Services         New       standard      DLRC     105         60
#> 15          Wells Fargo Dealer Services         New       standard      DLRC     105         72
#> 16 Wells Fargo Dealer Services CA South        Used       standard     NADAw     105         60
#> 17 Wells Fargo Dealer Services CA South        Used       standard     NADAw     105         72
#> 18 Wells Fargo Dealer Services CA South        Used       standard     NADAw     105         60
#> 19 Wells Fargo Dealer Services CA South        Used       standard     NADAw     105         72
#> 20 Wells Fargo Dealer Services CA South        Used       standard     NADAw     105         60
#> 21 Wells Fargo Dealer Services CA South        Used       standard     NADAw     105         72
#> 22 Wells Fargo Dealer Services CA South        Used       standard     NADAw     105         60
#> 23 Wells Fargo Dealer Services CA South        Used       standard     NADAw     105         72
#> 24 Wells Fargo Dealer Services CA South        Used       standard     NADAw     105         60
#> 25 Wells Fargo Dealer Services CA South        Used       standard     NADAw     105         48
#> 26               BMW Financial Services         New       standard      MSRP      95         65
#> 27               BMW Financial Services         New       standard      MSRP      95         72
#> 28               BMW Financial Services        Used       standard     NADAr      90         65
#> 29               BMW Financial Services        Used       standard     NADAr      90         72
#> 30               BMW Financial Services        Used       standard     NADAr      90         60
#> 31               BMW Financial Services        Used       standard     NADAr      90         60
#> 32               BMW Financial Services        Used       standard     NADAr      95         65
#> 33               BMW Financial Services        Used       standard     NADAr      95         72
#> 34                    Ford Motor Credit         New       standard      DLRC     130         60
#> 35                    Ford Motor Credit         New       standard      DLRC     130         72
#> 36                    Ford Motor Credit         New       standard      DLRC     130         75
#> 37                    Ford Motor Credit        Used       standard     NADAw     130         60
#> 38                    Ford Motor Credit        Used       standard     NADAw     130         72
#> 39                    Ford Motor Credit        Used       standard     NADAw     130         60
#> 40                    Ford Motor Credit        Used       standard     NADAw     130         72
#> 41                    Ford Motor Credit        Used       standard     NADAw     130         60
#> 42                    Ford Motor Credit        Used       standard     NADAw     130         48
#> 43                    Ford Motor Credit        Used certified_used     NADAw     130         60
#> 44                    Ford Motor Credit        Used certified_used     NADAw     130         72
#> 45                  Toyota Motor Credit         New       standard      DLRC     100         60
#> 46                  Toyota Motor Credit         New       standard      DLRC     100         66
#> 47                  Toyota Motor Credit         New       standard      DLRC     100         72
#> 48                  Toyota Motor Credit         New       standard      DLRC     100         75
#> 49         Toyota Motor Credit CA South        Used       standard      KWBB     100         60
#> 50         Toyota Motor Credit CA South        Used       standard      KWBB     100         66
#> 51         Toyota Motor Credit CA South        Used       standard      KWBB     100         72
#> 52         Toyota Motor Credit CA South        Used       standard      KWBB     100         75
#> 53         Toyota Motor Credit CA South        Used       standard      KWBB     100         60
#> 54         Toyota Motor Credit CA South        Used       standard      KWBB     100         60
#> 55         Toyota Motor Credit CA South        Used       standard      KWBB     100         60
#> 56         Toyota Motor Credit CA South        Used       standard      KWBB     100         60
#> 57         Toyota Motor Credit CA South        Used       standard      KWBB     100         60
#> 58         Toyota Motor Credit CA South        Used       standard      KWBB     100         48
#> 59         Toyota Motor Credit CA South        Used certified_used      KWBB     100         60
#> 60         Toyota Motor Credit CA South        Used certified_used      KWBB     100         66
#> 61         Toyota Motor Credit CA South        Used certified_used      KWBB     100         72
#> 62         Toyota Motor Credit CA South        Used certified_used      KWBB     100         75
#> 63                      Hyundai Finance         New       standard      DLRC     100         60
#> 64                      Hyundai Finance         New       standard      DLRC     100         72
#> 65  Nissan Motor Acceptance Corporation         New       standard      DLRC     115         63
#> 66  Nissan Motor Acceptance Corporation         New       standard      DLRC     115         72
#> 67  Nissan Motor Acceptance Corporation        Used       standard      KWBB     110         48
#> 68  Nissan Motor Acceptance Corporation        Used       standard      KWBB     110         60
#> 69  Nissan Motor Acceptance Corporation        Used       standard      KWBB     115         72
#> 70  Nissan Motor Acceptance Corporation        Used       standard      KWBB     110         48
#> 71  Nissan Motor Acceptance Corporation        Used       standard      KWBB     110         48
#> 72  Nissan Motor Acceptance Corporation        Used certified_used      KWBB     115         63
#> 73  Nissan Motor Acceptance Corporation        Used certified_used      KWBB     115         72
#> 74  Nissan Motor Acceptance Corporation        Used certified_used      KWBB     115         48
#> 75             Honda Financial Services         New       standard      DLRC     100         48
#> 76             Honda Financial Services         New       standard      DLRC     100         60
#> 77             Honda Financial Services         New       standard      DLRC     100         66
#> 78             Honda Financial Services         New       standard      DLRC     100         72
#> 79             Honda Financial Services        Used       standard       BBC      80         60
#> 80             Honda Financial Services        Used       standard       BBC      80         48
#> 81             Honda Financial Services        Used certified_used       BBC      85         60
#> 82             Honda Financial Services        Used certified_used       BBC      85         66
#> 83             Honda Financial Services        Used certified_used       BBC      85         72
#> 84             Honda Financial Services        Used certified_used       BBC      85         60
#> # ... with 6 more variables: bank_fee <dbl>, markup <dbl>,
#> #   rate_name <chr>, rate <dbl>, rng_min <dbl>, rng_max <dbl>
```

Current Issues
--------------

-   \[ \] Do not understand what a `rng_min` or `rng_max` value of `1` means. Typo? Error in cleaning?
