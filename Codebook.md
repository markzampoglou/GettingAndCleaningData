###Human activity recognition data collected with a waist-mounted smartphone
##Codebook
####Raw Data
* <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">Data source</a> (in .zip format)
* <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">Data description</a>

####Tidy data formation methodology
The tidy data contained in `Tidy.csv` was formed from the raw data set through a process of feature selection and summarization (via averaging). This section contains an overview of the formation process.

The raw data contained in `train/X_train.txt` and `test/X_test.txt` were read and combined in one unified dataset containing 10299 observations of 561 variables. The rows in this dataset corresponded to instances of equal-length sampling windows over 30 subjects for 6 different human actions. The columns corresponded to a number of time-domain or frequency-domain features drawn from each window samples.

For our needs, only the features corresponding to arithmetic means and standard deviations (std), i.e. only the first statistical moments were of interest. Thus, our script searches and identifies all features using the mean or std, using string-based search. The selection does not include a family of angle-based features (expressing the relationship between features, e.g. `angle(X,gravityMean)`), which, although containing the term "mean", do not correspond to the mean value of any population.

Following feature selection, we are left with 68 variables. The naming conventions followed by the original dataset are then replaced by more expressive and well-formed ones, using a number of operations. As an example, the variable `tBodyAcc-mean()-X` is converted to `time body acc mean x`. Furthermore, the activity index is converted from a numeric description to a text-based one, using the activity labels found in `activity_labels.txt`.

Having restructured the variable names and values, and selected only the features of interest, we proceeded to form our new, aggregated data set by averaging for the same activities by the same subject. Due to the time-split into windows, the data for every subject performing an activity were spread out along multiple rows, corresponding to different (overlapping) time windows. We aggregated the information contained in the features for these rows into one for each subject-activity combination, which resulted in a table of 180 rows with our 68 chosen variables.

####Tidy data set variables

1. `subject index`                          
2. `activity`                              
3. `time body acc mean x`                   
4. `time body acc mean y`                  
5. `time body acc mean z`                   
6. `time body acc std x`                   
7. `time body acc std y`                    
8. `time body acc std z`                   
9. `time gravity acc mean x`                
10. `time gravity acc mean y`               
11. `time gravity acc mean z`                
12. `time gravity acc std x`                
13. `time gravity acc std y`                 
14. `time gravity acc std z`                
15. `time body acc jerk mean x`              
16. `time body acc jerk mean y`             
17. `time body acc jerk mean z`              
18. `time body acc jerk std x`              
19. `time body acc jerk std y`               
20. `time body acc jerk std z`              
21. `time body gyro mean x`                  
22. `time body gyro mean y`                 
23. `time body gyro mean z`                  
24. `time body gyro std x`                  
25. `time body gyro std y`                   
26. `time body gyro std z`                  
27. `time body gyro jerk mean x`             
28. `time body gyro jerk mean y`            
29. `time body gyro jerk mean z`             
30. `time body gyro jerk std x`             
31. `time body gyro jerk std y`              
32. `time body gyro jerk std z`             
33. `time body acc mag mean`                 
34. `time body acc mag std`                 
35. `time gravity acc mag mean`              
36. `time gravity acc mag std`              
37. `time body acc jerk mag mean`            
38. `time body acc jerk mag std`            
39. `time body gyro mag mean`                
40. `time body gyro mag std`                
41. `time body gyro jerk mag mean`           
42. `time body gyro jerk mag std`           
43. `freq body acc mean x`              
44. `freq body acc mean y`             
45. `freq body acc mean z`              
46. `freq body acc std x`              
47. `freq body acc std y`               
48. `freq body acc std z`              
49. `freq body acc jerk mean x`         
50. `freq body acc jerk mean y`        
51. `freq body acc jerk mean z`         
52. `freq body acc jerk std x`         
53. `freq body acc jerk std y`          
54. `freq body acc jerk std z`         
55. `freq body gyro mean x`             
56. `freq body gyro mean y`            
57. `freq body gyro mean z`             
58. `freq body gyro std x`             
59. `freq body gyro std y`              
60. `freq body gyro std z`             
61. `freq body acc mag mean`            
62. `freq body acc mag std`            
63. `freq body body acc jerk mag mean`  
64. `freq body body acc jerk mag std`  
65. `freq body body gyro mag mean`      
66. `freq body body gyro mag std`      
67. `freq body body gyro jerk mag mean` 
68. `freq body body gyro jerk mag std`