"
Title: COVID vs GDP Data Preparation
Date: 22NOV2020
Author: John Koenig
Description: This script will download coronavirus source data from ourworldindata.org
             and it will prepare the dataset for analysis

"


# Download Data

data_source <- "https://covid.ourworldindata.org/data/owid-covid-data.csv"

print(paste("Loading data from -- ", data_source, sep=" "))
df <- read.csv(data_source)
#head(df)

# Select Today's Data
print(paste("Selecting today's data  -- ", Sys.Date(), sep=" "))
df_today <- df[df$date == Sys.Date(),]

# Select Columns
selected_vars <- c("iso_code", 
                   "continent", 
                   "location", 
                   "date", 
                   "total_cases", 
                   "total_deaths", 
                   "total_cases_per_million", 
                   "total_deaths_per_million", 
                   "population", 
                   "population_density", 
                   "median_age", 
                   "aged_65_older", 
                   "aged_70_older", 
                   "gdp_per_capita", 
                   "extreme_poverty", 
                   "cardiovasc_death_rate", 
                   "diabetes_prevalence", 
                   "female_smokers", 
                   "male_smokers", 
                   "handwashing_facilities", 
                   "hospital_beds_per_thousand", 
                   "life_expectancy", 
                   "human_development_index")

df_out <- df_today[selected_vars]


# Save Processed Data to CSV File
save_filepath <- paste(getwd(), "COVIDvsGDP_processed_v1.csv", sep="/")
print(paste("Saving processed data  -- ", save_filepath, sep=" "))
write.csv(df_out, save_filepath, row.names = FALSE)