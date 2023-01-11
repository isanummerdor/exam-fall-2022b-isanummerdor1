#main build rule
all: histogram.pdf plot.pdf 

#sub builds 
data/reviews.csv data/listings.csv: src/download.R
	R --vanilla < src/download.R

df_listings_merged: data/reviews.csv data/listings.csv
	R --vanilla < src/clean.R

df_aggregated: df_merged src/aggregate.R 
	R --vanilla < src/aggregate.R

histogram.pdf: df_listings_merged histogram.R
	R --vanilla < src/histogram.R 

plot.pdf: df_aggregated plot.R
	R --vanilla < src/plot.R

