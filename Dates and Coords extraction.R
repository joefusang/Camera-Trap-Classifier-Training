
install.packages("ggplot2")
install.packages("ggmap")
library(ggplot2)
library(ggmap)
library(dplyr)

dates_and_coords_files = list.files("./Dates and Coords", recursive = TRUE, full.names = TRUE, pattern = "(?i)coords")

# Initialize the list to store the data frames
dates_and_coords_csvs = vector("list", length(dates_and_coords_files))

# Reading each file and storing the data frame in the list
for (i in 1:length(dates_and_coords_files)) {
  # Attempt to read the CSV with the assumption of UTF-8 encoding
  df = read.csv(dates_and_coords_files[i], fileEncoding = "UTF-8")
  
  # If there are encoding issues, try a different encoding or specify stringsAsFactors
  if (any(is.na(df))) {
    df = read.csv(dates_and_coords_files[i], fileEncoding = "Latin1")
  }
  
  dates_and_coords_csvs[[i]] = df
}

# Initialize an empty dataframe to store all coordinates
all_coords <- data.frame(Latitude = numeric(), Longitude = numeric())

# Loop through each dataframe in the list
for (df in dates_and_coords_csvs) {
  # Find columns that match latitude and longitude patterns
  lat_col <- grep("(?i)lat", names(df), value = TRUE)
  long_col <- grep("(?i)long", names(df), value = TRUE)
  
  # Check if both latitude and longitude columns are found
  if (length(lat_col) == 1 && length(long_col) == 1) {
    # Select only the latitude and longitude columns
    coords <- df %>% select(!!lat_col, !!long_col)
    
    # Rename columns to Latitude and Longitude for uniformity
    names(coords) <- c("Latitude", "Longitude")
    
    # Remove rows with NA values
    coords <- na.omit(coords)
    
    # Append to the all_coords dataframe
    all_coords <- rbind(all_coords, coords)
  } else {
    # Optional: Handle cases where the pattern does not match expected columns
    print(paste("Latitude or Longitude columns not found in", names(df)))
  }
}

# Write the combined coordinates to a CSV file
write.csv(all_coords, "all_coordinates.csv", row.names = FALSE)


# Define the bounding box for London
london_bbox <- c(left = -0.5103751, bottom = 51.28676, right = 0.3340155, top = 51.6918741)

# Fetch the map

register_stadiamaps(key = "a2a61170-777a-4dee-ab21-a5702df00d9a")

london <- c(left = -0.5103751, bottom = 51.28676, right = 0.3340155, top = 51.6918741)

london_map <- get_stadiamap(london, source = "stadia", maptype = "stamen_terrain_background", zoom = 12)

all_coords$Longitude <- as.numeric(as.character(all_coords$Longitude))
all_coords$Latitude <- as.numeric(as.character(all_coords$Latitude))

# Check for any remaining NA values that might have been introduced
# by conversion (in case there were non-numeric characters)
all_coords <- na.omit(all_coords)

library(sf)

# Load shapefile
london_boroughs <- st_read("./Dates and Coords/London_Borough_Excluding_MHW.shp ")

# Transform coordinate system if needed to match the map's projection
london_boroughs <- st_transform(london_boroughs, crs = st_crs(london_map))






































