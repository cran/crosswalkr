## ----message = FALSE----------------------------------------------------------
library(crosswalkr)
library(dplyr)
library(haven)

## -----------------------------------------------------------------------------
## data
df <- tibble(id = c(1:8,10,12,14:16,31,33),
             state = c('AL','AK','AZ','AR','CA','CO','CT','DE','FL','HI',
                       'IL','IN','IA','NJ','NY'),
			 cendiv = c(6,9,8,7,9,8,1,5,5,9,3,3,4,2,2),
			 cendiv_name = c('East South Central','Pacific','Mountain',
                        'West South Central','Pacific','Mountain','New England',
                        'South Atlantic','South Atlantic','Pacific',
                        'East North Central','East North Central',
                        'West North Central','Middle Atlantic',
                        'Middle Atlantic'))
			 
## crosswalk
cw <- tibble(cendiv = 1:9,
             cenreg = c(1,1,2,2,3,3,3,4,4),
             cenregnm = c('Northeast','Northeast','Midwest','Midwest',
                          'South','South','South','West','West'))

## -----------------------------------------------------------------------------
## encode new column
df <- df %>% 
    mutate(cenreg = encodefrom(., var = cendiv, cw_file = cw, raw = cendiv,
                               clean = cenreg, label = cenregnm))

## -----------------------------------------------------------------------------
df

