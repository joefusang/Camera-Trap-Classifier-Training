setwd("D:/")
library(dplyr)
library(data.table)

install.packages("readr")
library(readr)

#Network Rail dataset

#Creating a list of file paths that contain "count"  

NR_counts = list.files("NetworkRail22/", recursive = TRUE, full.names = TRUE, pattern = "(?i)count")

#Turning the list of file paths in to a list of CSVs read from the CSV files listed

NR_detections = NULL
for (i in 1:length(NR_counts)) {
  df = read.csv(NR_counts[i])
  NR_detections[[i]] = df
}

#Editing file paths 

NR_detections[[1]]$SourceFile = gsub('Barnes_Tagged/ProcessedData', 'NetworkRail22/Barnes_Tagged', NR_detections[[1]]$SourceFile)
NR_detections[[2]]$SourceFile = gsub('E:/', 'D:/', NR_detections[[2]]$SourceFile)
NR_detections[[3]]$SourceFile = gsub('Lewisham', 'NetworkRail22', NR_detections[[3]]$SourceFile)
NR_detections[[4]]$SourceFile = gsub('E:/', 'D:/', NR_detections[[4]]$SourceFile)
NR_detections[[5]]$SourceFile = gsub('E:/', 'D:/', NR_detections[[5]]$SourceFile)
NR_detections[[6]]$SourceFile = gsub('Lewisham/HitherGreen', 'NetworkRail22', NR_detections[[6]]$SourceFile)

#Extracting required columns from CSVs

NR_detections2 = NULL
for (i in 1:length(NR_detections)) {
  subset = NR_detections[[i]]
  NR_detections2[[i]] = subset[, c('SourceFile', 'Subject')] 
}



#Hampstead Heath dataset

#Creating a list of file paths that contain "count" or "exif"

HH_counts = list.files("Hampstead Heath 2021/", recursive = TRUE, full.names = TRUE, pattern = "(?i)count|exif")

#Removing "exiftool" files 

HH_counts  = HH_counts[!grepl('(?i)exiftool', HH_counts)]

#Turning the list of file paths in to a list of CSVs read from the CSV files listed

HH_detections = NULL
for (i in 1:length(HH_counts)) {
  df = read.csv(HH_counts[i])
  HH_detections[[i]] = df
}

#Editing file paths 

HH_detections[[1]]$SourceFile = gsub('E:/MeganHH', 'D:/Hampstead Heath 2021', HH_detections[[1]]$SourceFile)
HH_detections[[2]]$SourceFile = gsub('E:/MeganHH', 'D:/Hampstead Heath 2021', HH_detections[[2]]$SourceFile)
HH_detections[[3]]$SourceFile = gsub('E:/MeganHH', 'D:/Hampstead Heath 2021', HH_detections[[3]]$SourceFile)
HH_detections[[4]]$SourceFile = gsub('E:/MeganHH', 'D:/Hampstead Heath 2021', HH_detections[[4]]$SourceFile)

HH_detections[[5]]$SourceFile = gsub('/Volumes/LaCie', 'D:/Hampstead Heath 2021', HH_detections[[5]]$SourceFile)
HH_detections[[6]]$SourceFile = gsub('/Volumes/LaCie', 'D:/Hampstead Heath 2021', HH_detections[[6]]$SourceFile)
HH_detections[[7]]$SourceFile = gsub('/Volumes/LaCie', 'D:/Hampstead Heath 2021', HH_detections[[7]]$SourceFile)
HH_detections[[8]]$SourceFile = gsub('/Volumes/LaCie', 'D:/Hampstead Heath 2021', HH_detections[[8]]$SourceFile)
HH_detections[[9]]$SourceFile = gsub('/Volumes/LaCie', 'D:/Hampstead Heath 2021', HH_detections[[9]]$SourceFile)
HH_detections[[10]]$SourceFile = gsub('/Volumes/LaCie', 'D:/Hampstead Heath 2021', HH_detections[[10]]$SourceFile)
HH_detections[[11]]$SourceFile = gsub('/Volumes/LaCie', 'D:/Hampstead Heath 2021', HH_detections[[11]]$SourceFile)
HH_detections[[12]]$SourceFile = gsub('/Volumes/LaCie', 'D:/Hampstead Heath 2021', HH_detections[[12]]$SourceFile)
HH_detections[[13]]$SourceFile = gsub('/Volumes/LaCie', 'D:/Hampstead Heath 2021', HH_detections[[13]]$SourceFile)
HH_detections[[14]]$SourceFile = gsub('/Volumes/LaCie', 'D:/Hampstead Heath 2021', HH_detections[[14]]$SourceFile)
HH_detections[[15]]$SourceFile = gsub('/Volumes/LaCie', 'D:/Hampstead Heath 2021', HH_detections[[15]]$SourceFile)

#Extracting required columns from CSVs

HH_detections2 = NULL
for (i in 1:length(HH_detections)) {
  subset = HH_detections[[i]]
  HH_detections2[[i]] = subset[, c('SourceFile', 'Subject')] 
}



#Richmond Dataset

#Creating a list of file paths that contain "count" or "exif"

RM_counts = list.files("Richmond_2022/", recursive = TRUE, full.names = TRUE, pattern = "(?i)count|exif")

#Removing "exiftool" files 

RM_counts  = RM_counts[!grepl('(?i)exiftool', RM_counts)]

#Turning the list of file paths in to a list of CSVs read from the CSV files listed

RM_detections = NULL
for (i in 1:length(RM_counts)) {
  df = read.csv(RM_counts[i])
  RM_detections[[i]] = df
}

#Editing file paths

RM_detections[[1]]$SourceFile = gsub('IoT_Richmond22/10th_deployment_Twick_Hampton/Report1', 'Richmond_2022/10th_deployment', RM_detections[[1]]$SourceFile)
RM_detections[[2]]$SourceFile = gsub('IoT_Richmond22/10th_deployment_Twick_Hampton/Report2', 'Richmond_2022/10th_deployment', RM_detections[[2]]$SourceFile)
RM_detections[[3]]$SourceFile = gsub('E:/11th_Deployment_Tagged/11th_deployment_Orleans', 'D:/Richmond_2022/11th_Deployment', RM_detections[[3]]$SourceFile)
RM_detections[[4]]$SourceFile = gsub('G:/', 'D:/', RM_detections[[4]]$SourceFile)
RM_detections[[5]]$SourceFile = gsub('2022/Richmond_IoT', 'Richmond_2022', RM_detections[[5]]$SourceFile)
RM_detections[[6]]$SourceFile = gsub('2022/Richmond_IoT', 'Richmond_2022', RM_detections[[6]]$SourceFile)
RM_detections[[7]]$SourceFile = gsub('F:/Barnes22/BEAFP', 'D:/Richmond_2022/4th_deployment/Barnes Elms and Fishing Ponds', RM_detections[[7]]$SourceFile)
RM_detections[[8]]$SourceFile = gsub('Barnes_Common_2022_no_people', 'Richmond_2022/4th_deployment/Barnes Common', RM_detections[[8]]$SourceFile)

#number 9 I have to sub something and remove something else

RM_detections[[9]]$SourceFile = gsub('G:/2022_Data/Richmond_IoT', 'D:/Richmond_2022', RM_detections[[9]]$SourceFile)
RM_detections[[9]]$SourceFile = gsub('/TaggedforProcessing/ALLno12', '', RM_detections[[9]]$SourceFile)
RM_detections[[10]]$SourceFile = gsub('G:/2022_Data/Richmond_IoT', 'D:/Richmond_2022', RM_detections[[10]]$SourceFile)
RM_detections[[11]]$SourceFile = gsub('E:/', 'D:/', RM_detections[[11]]$SourceFile)
RM_detections[[12]]$SourceFile = gsub('E:/2022_Data/Richmond_IoT/6th_deployment_Tow_path_TaggedProcessed', 'D:/Richmond_2022/6th_deployment', RM_detections[[12]]$SourceFile)
RM_detections[[13]]$SourceFile = gsub('LCP22', 'Richmond_2022/7th_deployment', RM_detections[[13]]$SourceFile)

#no editing required on 14 or 15

RM_detections[[16]]$SourceFile = gsub('E:/2022/Richmond_IoT/RiffleClub/RC_Tagged', 'D:/Richmond_2022/Test_RiffleClub', RM_detections[[16]]$SourceFile)

#Extracting required columns from CSVs

RM_detections2 = NULL
for (i in 1:length(RM_detections)) {
  subset = RM_detections[[i]]
  RM_detections2[[i]] = subset[, c('SourceFile', 'Subject')] 
}


#binding the CSVs together


NR_bind = rbindlist(NR_detections2)
HH_bind = rbindlist(HH_detections2)
RM_bind = rbindlist(RM_detections2)

master_bind = rbind(NR_bind, HH_bind, RM_bind)

#attempting to remove symbols from the files 

# Function to clean file paths

cleaned_master_bind = master_bind

clean_file_paths = function(path) {
  # Replace unrecognizable symbols with a placeholder (you can modify this)
  cleaned_path = iconv(path, to = "ASCII", sub = "")
  # Remove any remaining special characters or spaces
  cleaned_path = gsub("[^A-Za-z0-9.:_/-\\(\\),& ]", "", cleaned_path)
  return(cleaned_path)
}

# Apply the cleaning function to the 'file_path' column

cleaned_master_bind$SourceFile = sapply(cleaned_master_bind$SourceFile, clean_file_paths)

write.csv(cleaned_master_bind, "cleaned_file.csv", row.names = FALSE)

#saving master bind as CSV

write.csv(master_bind, file = "D:/master_bind.csv", row.names = FALSE)

#checking file paths are correct 

pathcorrect = NULL
file_paths = master_bind$SourceFile

for (i in 1:length(file_paths)) { 
  
  pathcorrect[i] = file.exists(file_paths[i])
}

#counting how many file paths are correct 

truecount = 0

for (i in 1:length(pathcorrect)) {
  if (pathcorrect[i] == TRUE) {
    truecount = truecount + 1
  }
}

percent_true = ( truecount / (length(pathcorrect)) ) * 100

#now checking how many paths are correct in the new cleaned csv

cleaned_pathcorrect = NULL
cleaned_file_paths = cleaned_master_bind$SourceFile

for (i in 1:length(file_paths)) { 
  
  cleaned_pathcorrect[i] = file.exists(cleaned_file_paths[i])
}

#counting how many file paths are correct 

cleaned_truecount = 0

for (i in 1:length(cleaned_pathcorrect)) {
  if (cleaned_pathcorrect[i] == TRUE) {
    cleaned_truecount = cleaned_truecount + 1
  }
}

cleaned_percent_true = ( cleaned_truecount / (length(cleaned_pathcorrect)) ) * 100

#working out which folders contain the file paths that aren't correct

# Initialize counters for each folder
hampstead_counter <- 0
networkrail_counter <- 0
richmond_counter <- 0

# Loop through the lists simultaneously
for (i in seq_along(cleaned_pathcorrect)) {
  if (!cleaned_pathcorrect[i]) {
    # Increment the counter based on the folder in the file path
    if (grepl("Hampstead", cleaned_file_paths[i])) {
      hampstead_counter <- hampstead_counter + 1
    } else if (grepl("NetworkRail", cleaned_file_paths[i])) {
      networkrail_counter <- networkrail_counter + 1
    } else if (grepl("Richmond", cleaned_file_paths[i])) {
      richmond_counter <- richmond_counter + 1
    }
  }
}

# Print the counts for each folder
cat("Hampstead Counter:", hampstead_counter, "\n")
cat("NetworkRail Counter:", networkrail_counter, "\n")
cat("Richmond Counter:", richmond_counter, "\n")

#the majority of the incorrect file paths are coming from the Richmond file

#adapting this code so that it tells me which deployments from the Richmond file contain the errors

# Initialize counters for each folder
first_counter = 0
second_counter = 0
third_counter = 0
fourth_counter = 0
fifth_counter = 0
sixth_counter = 0
seventh_counter = 0
eighth_counter = 0
ninth_counter = 0
tenth_counter = 0
eleventh_counter = 0
riffle_counter = 0 

# Loop through the lists simultaneously

for (i in seq_along(cleaned_pathcorrect)) {
  if (cleaned_pathcorrect[i] == TRUE) {
    # Increment the counter based on the folder in the file path
    if (grepl("1st", cleaned_file_paths[i])) {
      first_counter = first_counter + 1
    } else if (grepl("2nd", cleaned_file_paths[i])) {
      second_counter = second_counter + 1
    } else if (grepl("3rd", cleaned_file_paths[i])) {
      third_counter = third_counter + 1
    } else if (grepl("4th", cleaned_file_paths[i])) {
      fourth_counter = fourth_counter + 1
    } else if (grepl("5th", cleaned_file_paths[i])) {
      fifth_counter = fifth_counter + 1
    } else if (grepl("6th", cleaned_file_paths[i])) {
      sixth_counter = sixth_counter + 1
    } else if (grepl("7th", cleaned_file_paths[i])) {
      seventh_counter = seventh_counter + 1
    } else if (grepl("8th", cleaned_file_paths[i])) {
      eighth_counter = eighth_counter + 1
    } else if (grepl("9th", cleaned_file_paths[i])) {
      ninth_counter = ninth_counter + 1
    } else if (grepl("10th", cleaned_file_paths[i])) {
      tenth_counter = tenth_counter + 1
    } else if (grepl("11th", cleaned_file_paths[i])) {
      eleventh_counter = eleventh_counter + 1
    } else if (grepl("(?i)riffle", cleaned_file_paths[i])) {
      riffle_counter = riffle_counter + 1
    }
  }
}

# Print the counts for each folder
cat("1st Counter:", first_counter, "\n")
cat("2nd Counter:", second_counter, "\n")
cat("3rd Counter:", third_counter, "\n")
cat("4th Counter:", fourth_counter, "\n")
cat("5th Counter:", fifth_counter, "\n")
cat("6th Counter:", sixth_counter, "\n")
cat("7th Counter:", seventh_counter, "\n")
cat("8th Counter:", eighth_counter, "\n")
cat("9th Counter:", ninth_counter, "\n")
cat("10th Counter:", tenth_counter, "\n")
cat("11th Counter:", eleventh_counter, "\n")
cat("Riffle Counter:", riffle_counter, "\n")

#For running the images through megadetector I only need the list of file paths that are correct 
#I also only need the images that contain a species within them so need to filter for images that have an entry for species in the 'Subject' column


cleaned_master_bind_logical = cleaned_master_bind

cleaned_master_bind_logical = mutate(cleaned_master_bind_logical, PathCorrect = NA)

# Add the 'PathCorrect' column to 'cleaned_master_bind_logical'
cleaned_master_bind_logical[['PathCorrect']] = cleaned_pathcorrect

# Create a new DataFrame to store the subsetted data
species_true_only = cleaned_master_bind_logical

# Filter the DataFrame to include only entries that contain the word "species" and are TRUE in the PathCorrect column
species_true_only = filter(species_true_only, grepl("species", Subject), PathCorrect == TRUE)

species_true_only_paths = species_true_only$SourceFile

test_paths = NULL

for (i in 1:30) {
  test_paths[i] = species_true_only_paths[i]
}

write.csv(test_paths, file = "D:/test_paths.csv", row.names = FALSE)

#creating a csv that only contains real file paths that lead to files that contain
#animals 

write.csv(species_true_only_paths, file = "D:/species_true_only_paths.csv", row.names = FALSE)
