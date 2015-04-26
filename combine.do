// make sure no data in memory

clear

// move to the directory just above one with data

cd "/Users/y_ushioda/Desktop"

// make sure you put a copy of the first data here
// use this data as master file

insheet using "copy.csv", names

// drop rows except the first three rows manually beforehands
// drop observations

drop in 1/2

// move to the directory with data

cd "/Users/y_ushioda/Desktop/raw_data"

save master, replace

// create file list from which to collect data to combine

local csvfiles: dir "/Users/y_ushioda/Desktop/raw_data" files "*.csv"

// loop through file list

foreach file of local csvfiles {
	clear
	// read a file, create a temporary Stata dataset from it,
    // read in the master file, and append the temporary file
    // to it, resaving the master at the end for the next
    // iteration through the loop
	insheet using `file', names
	save temp, replace
	use master
	append using temp, force
	erase temp.dta
	save master, replace
}

// combined file will be created in the folder with raw data
