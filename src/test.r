complete <- function(directory, id = 1:332) {
  pd_list <- list.files("specdata", full.names=TRUE)
  ct <- 0
  for (i in id) {
  
	ct <- ct + nrow(na.omit(read.csv(pd_list[i])))
  }
  ct
}

  //allpd <- data.frame()  
  
  nrow(na.omit(allpd))//
  
      allpd <- rbind(allpd, read.csv(pd_list[i]))
	  
complete <- function(directory, id = 1:332) {
  fileNameList <- list.files("specdata", full.names=TRUE)
  
  #New data frame with column labels (i hope)
  dataFrame <- data.frame(TableId=numeric(0), GoodStuffCount=numeric(0))
  
  for (i in id) {
	csvData <- read.csv(fileNameList[i])
	
	#<sp>?
	blanksOmited <- na.omit(csvData)
	
	#Create vector to append
	vectorToAppend <- c(i, nrow(blanksOmited))
	
	#Append vector
	dataFrame <- rbind(dataFrame, vectorToAppend)
  }
  #Return data frame
  dataFrame
}

complete <- function(directory, id = 1:332) {
  fileNameList <- list.files("specdata", full.names=TRUE)
  
  #New data frame with column labels (i hope)
  nonNACounts <- numeric()
  
  for (i in id) {
	csvData <- read.csv(fileNameList[i])
	
	#<sp>?
	blanksOmited <- na.omit(csvData)
	
	#Append count
	nonNACounts <- c(nonNACounts, nrow(blanksOmited))
  }
  
  #Return data frame
  data.frame(TableId=id, GoodStuffCount=nonNACounts)
}

corr <- function(directory, threshold) {
	fileNameList <- list.files("specdata", full.names=TRUE)
	
	#Empty vector
	correlations <- numeric()
	
	for (f in fileNameList){
		completeCases <- na.omit(read.csv(f))
				
		#Are we above the required threshold?
		if (nrows(completeCases) > threshold){			
		
			#Extract vectors for cor function arguments (x and y)
			sulfateVector <- completeCases[, "sulfate"]
			nitrateVector <- completeCases[, "nitrate"]		
		
			#Correlate and store result in accumulation vector
			correlations <- c(correlations, cor(sulfateVector, nitrateVector))
		}
	}
	
	correlations
}
