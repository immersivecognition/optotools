library(optotools)

# read our optotrak file
opto_data <- read_ndi("test_data/C#001.ROO")

# we can access properties such as frequency, number of markers, and more
opto_data$freq
opto_data$items

# to access the data, access the df object or convert using as.data.frame
df <- as.data.frame(opto_data)
head(df)




library(optotools)

# define file path and a desired output file location
ndi_path <- "test_data/C#001.ROO"
csv_path <- "test_data/C#001.ROO.csv"

# convert the file
ndi_to_csv(ndi_path, csv_path)
