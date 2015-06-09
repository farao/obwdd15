# obwdd15
Shows the results for the mayor election of Dresden 2015

## Usage

./scrape_data.sh - Run this to scrape the election results and write them to data/results_by_area.json  
./run_everything - Scrapes the data, sorts it by candidate and election result, generates the webpage (index.html) and categorizes the data additionally. All data lands in the data/ directory  

## Scripts

All script print their results to stdout. For get_data.rb the mechanize gem needs to be installed: gem install mechanize

get_data.rb - Scrapes the election results from wahlen.dresden.de  
sort_by_candidate.rb - Pipe the data from get_data.rb into this script to sort it by candidate and election result  
sorted_to_html.rb - Pipe the data from sort_by_candidate.rb into this script to generate a website with the results  
categorize.rb - Pipe the data from sort_by_candidate.rb into this script to sort each result in one of 5 categories. Preparation for a presentation on a map (to come..)  
