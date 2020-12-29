# Codebook  
#### includes:  
- background / context of the raw data  
- a description of the raw data 
- a description of the processed data included in this repo   
- a description of the transformations performed to get to the tidy data set  

Note: large portions of this codebook were adopted from the description of the data made available together with the original data. Thus, credit is due to the original authors.

## Background
Note: this description was directly taken from [this website](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and all credit belongs to the original authors. 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Raw data
The raw data includes the following features.  

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag

Additionally, transformations were applied to these variables by the original authors of the experiment, such that for each of the above features, the data includes separate variables with the following transformation of the feature.  

mean(): Mean value  
std(): Standard deviation  
mad(): Median absolute deviation   
max(): Largest value in array  
min(): Smallest value in array  
sma(): Signal magnitude area  
energy(): Energy measure. Sum of the squares divided by the number of values.   
iqr(): Interquartile range   
entropy(): Signal entropy  
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals  
maxInds(): index of the frequency component with largest magnitude  
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
skewness(): skewness of the frequency domain signal   
kurtosis(): kurtosis of the frequency domain signal   
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.  
angle(): Angle between to vectors.  

## Processed data: tidyavgs.csv
The data set *tidyavgs.csv* found in this repo contains the group means for each
individual, for each activity for all the following variables, except for the *subject*
and *activity* variables. These are used to identify the participants and the activities performed, respectively. The data set thus contains the following variables:

subject - identifier for the participant of the experiment. Factor
variable running from 1 to 30.  
activity - label for the type of activity the participants were doing. Factor 
variable with 6 levels. Labels are: walking, walking_upstairs, walking_downstairs,
sitting, standing, and laying.

For the following variables, a similar description applies as in the raw data set.
However, here variables have been summarized such that each variable shows the
group mean per individual, per activity. The variable names have not been changed
as compared to the raw data labels, as to not make the names even more abstruse.  

tBodyAcc-mean()-X               
tBodyAcc-mean()-Y              
tBodyAcc-mean()-Z               
tBodyAcc-std()-X               
tBodyAcc-std()-Y                
tBodyAcc-std()-Z               
tGravityAcc-mean()-X            
tGravityAcc-mean()-Y           
tGravityAcc-mean()-Z            
tGravityAcc-std()-X            
tGravityAcc-std()-Y             
tGravityAcc-std()-Z            
tBodyAccJerk-mean()-X           
tBodyAccJerk-mean()-Y          
tBodyAccJerk-mean()-Z           
tBodyAccJerk-std()-X           
tBodyAccJerk-std()-Y            
tBodyAccJerk-std()-Z           
tBodyGyro-mean()-X              
tBodyGyro-mean()-Y             
tBodyGyro-mean()-Z              
tBodyGyro-std()-X              
tBodyGyro-std()-Y               
tBodyGyro-std()-Z              
tBodyGyroJerk-mean()-X          
tBodyGyroJerk-mean()-Y         
tBodyGyroJerk-mean()-Z          
tBodyGyroJerk-std()-X          
tBodyGyroJerk-std()-Y           
tBodyGyroJerk-std()-Z          
tBodyAccMag-mean()              
tBodyAccMag-std()              
tGravityAccMag-mean()           
tGravityAccMag-std()           
tBodyAccJerkMag-mean()          
tBodyAccJerkMag-std()          
tBodyGyroMag-mean()             
tBodyGyroMag-std()             
tBodyGyroJerkMag-mean()         
tBodyGyroJerkMag-std()         
fBodyAcc-mean()-X               
fBodyAcc-mean()-Y              
fBodyAcc-mean()-Z               
fBodyAcc-std()-X               
fBodyAcc-std()-Y                
fBodyAcc-std()-Z               
fBodyAcc-meanFreq()-X           
fBodyAcc-meanFreq()-Y          
fBodyAcc-meanFreq()-Z           
fBodyAccJerk-mean()-X          
fBodyAccJerk-mean()-Y           
fBodyAccJerk-mean()-Z          
fBodyAccJerk-std()-X            
fBodyAccJerk-std()-Y           
fBodyAccJerk-std()-Z            
fBodyAccJerk-meanFreq()-X      
fBodyAccJerk-meanFreq()-Y       
fBodyAccJerk-meanFreq()-Z      
fBodyGyro-mean()-X              
fBodyGyro-mean()-Y             
fBodyGyro-mean()-Z              
fBodyGyro-std()-X              
fBodyGyro-std()-Y               
fBodyGyro-std()-Z              
fBodyGyro-meanFreq()-X          
fBodyGyro-meanFreq()-Y         
fBodyGyro-meanFreq()-Z          
fBodyAccMag-mean()             
fBodyAccMag-std()               
fBodyAccMag-meanFreq()         
fBodyBodyAccJerkMag-mean()      
fBodyBodyAccJerkMag-std()      
fBodyBodyAccJerkMag-meanFreq()  
fBodyBodyGyroMag-mean()        
fBodyBodyGyroMag-std()          
fBodyBodyGyroMag-meanFreq()    
fBodyBodyGyroJerkMag-mean()     
fBodyBodyGyroJerkMag-std()     
fBodyBodyGyroJerkMag-meanFreq()  

## Transformations
I undertook several transformations to get from the raw data to the processed data.
First, I merged the training and test data and included the identifier variables *subject* and *activity*, which in the original data were contained in separate files. I then named the features (columns) accordingly with descriptive variable names, most of which were contained in a separate file included with the raw data.
Next, I selected only the variables *subject* and *activity*, along with all variables that contained the mean or standard deviation of the measurements undertaken by the original authors. In this process, I also re-coded the *activity* variable such that it contains descriptive labels instead of numbers. Finally, I sorted the data by *activity*, by *group*, and took the mean for all groups to obtain the processed data.






