# combine_eventbrite_attendees.R
#
# Purpose: Combine Eventbrite attendee lists of all of GSGGB's past events and 
# conferences, filter for their email only, remove duplicate emails, and then 
# write it to a new csv file.
#
# Author: Jedid Ahn (jedid.ahn@mail.utoronto.ca)
#
# Date: 2020-03-07
#
# ========================================================================================

# Folder path dependent on working computer.
folderPath <- "C:/Jed's Work/Clubs/GSGGB/Eventbrite Attendees/"

fileNames <- list.files(folderPath, pattern = "\\.csv$")
emails <- c()
totalNumEmails <- 0

for (i in 1:length(fileNames)){
  attendeesDF <- read.csv(paste0(folderPath, fileNames[i]), stringsAsFactors = FALSE)
  emails <- c(emails, attendeesDF$Email)
  totalNumEmails <- totalNumEmails + length(attendeesDF$Email)
}

uniqueEmails <- as.data.frame(unique(emails))
names(uniqueEmails) <- c("Email")

write.csv(uniqueEmails, "email_list.csv", row.names = FALSE)

# [END]