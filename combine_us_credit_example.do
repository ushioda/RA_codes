// make sure no data in memory

clear

// move to the directory just above one with data

cd "/Users/y_ushioda/Dropbox/RA"

// make sure you put a copy of the first data here
// use this data as master file

insheet using "copyexample1.csv"

// drop observations

drop in 1/5

// move to the directory with data

cd "/Users/y_ushioda/Dropbox/RA/examplefolder"

save master, replace

// create file list from which to collect data to combine

local csvfiles: dir "/Users/y_ushioda/Dropbox/RA/examplefolder" files "*.csv"

// loop through file list

foreach file of local csvfiles {
	clear
	// read a file, create a temporary Stata dataset from it,
    // read in the master file, and append the temporary file
    // to it, resaving the master at the end for the next
    // iteration through the loop
	insheet using `file'
	// drop irrelevant rows
	drop in 1/3
	save temp, replace
	use master
	append using temp
	erase temp.dta
	save master, replace
}

// make sure you copy paste the variable names afterwards by excel
