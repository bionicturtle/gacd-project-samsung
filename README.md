Getting and Cleaning Data Course Project (samsung)
====================

For this assignment, the key files in this repo are

* [tidySamsung.txt](https://github.com/bionicturtle/gacd-project-samsung/blob/master/tidySamsung.txt) <- this is the (wide form) tidy dataset produced by my script
* [CodeBook.md](https://github.com/bionicturtle/gacd-project-samsung/blob/master/CodeBook.md) <- this is the Code Book which describes the feature (variables) in tidySamsung.txt
* [run_analysis.R](https://github.com/bionicturtle/gacd-project-samsung/blob/master/run_analysis.R) <- this is my script which produced tidySamsung.txt

I am indebited to David Hood's FAQ especially [this diagram](https://github.com/bionicturtle/gacd-project-samsung/blob/master/david_hood_diagram.png), which greatly accelerated my comprehension of the assignment's data files, and further for his excellent commentary on wide-versus-narrow tidy data. 

To understand wide/long, consider that the assignment ask for summary statistics (i.e., mean, std) on 66 feature variables for 30 subjects while they conduct six (6) activities: datawise there are 30 * 6 * 66 = 11,880 values in cells. 

* The wide form (e.g., tidySamsung.text) displays 180 rows (30 subjects * 6 activities) * 66 measures
* The tallest form is to simply stack the values in one column (see script comments for code). This long form is 11,880 observations, one for each combination of subject+activity+measure
* It's also possible to display 396 rows (6 activities * 66 measures) * 30 subjects; or 1,980 rows (30 subjects * 66 measures) * 6 activities
