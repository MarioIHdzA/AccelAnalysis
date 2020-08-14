This repo contains the script with which I analyse the data from the
Samsung accelerometer by merging the organized data into one 
single DF, then using the *apply family to perform the multiple
operations necessary to pass this test. These are described as 
follows:

1.- Obtaining and organizing the data.
	Basicaly I read the data and saving such as a readable
	spanish variable adding a tag to each column and the
	tags that the proyect provided in the archives.
2.- Naming the messy data.
	I then procceeded to change the kinda robotic names of
	the variables in features fot other that made more sense.
3.- Obtaining the related measurements.
	Using the powerful Dplyr I created a chain to analyse the
	resulting DF into the means and sd by using the "funs()"
	function, saving the df in a .txt file using the "write
	.table()" function.