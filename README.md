# optotools
An R package for reading and converting NDI Optotrak files


## Install

```r
install.packages("devtools")
devtools::install_github("immersivecognition/optotools")
```

## Example usage

### Reading Optotrak files into R

```r
> library(optotools)

# read our optotrak file
> opto_data <- read_ndi("test_data/C#001.ROO")

# we can access properties such as frequency, number of markers, and more
> opto_data$freq
[1] 100
> opto_data$items
[1] 3

# to access the data, access the $df object or convert using as.data.frame
> df <- as.data.frame(opto_data)
> head(df)
       m1_x      m1_y      m1_z      m2_x      m2_y      m2_z      m3_x      m3_y      m3_z
1 -171.5438 -85.16942 -1678.133 -185.6128 -124.5331 -1650.270 -175.0296 -245.9224 -1677.087
2 -171.5035 -85.18700 -1678.135 -185.6004 -124.5561 -1650.293 -175.0293 -245.9520 -1677.156
3 -171.5171 -85.19904 -1678.138 -185.5959 -124.5658 -1650.240 -175.0440 -245.9581 -1677.125
4 -171.5287 -85.19955 -1678.129 -185.6182 -124.5648 -1650.248 -175.0433 -245.9706 -1677.152
5 -171.5186 -85.21958 -1678.150 -185.5982 -124.5764 -1650.217 -175.0041 -245.9725 -1677.100
6 -171.5503 -85.22855 -1678.174 -185.6010 -124.5763 -1650.217 -175.0202 -245.9779 -1677.117
```


### Converting an Optotrak file into a CSV

```r
> library(optotools)

# define file path and a desired output file location
> ndi_path <- "test_data/C#001.ROO"
> csv_path <- "test_data/C#001.ROO.csv"

# convert the file
> ndi_to_csv(ndi_path, csv_path)
```
