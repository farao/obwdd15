#!/bin/bash

chmod a+x get_data.rb
chmod a+x sort_by_candidate.rb
chmod a+x sorted_to_html.rb
chmod a+x categorize.rb

./get_data.rb > data/results_by_area.json
./sort_by_candidate.rb < data/results_by_area.json > data/results_by_candidate.json
./sorted_to_html.rb < data/results_by_candidate.json > index.html
./categorize.rb < data/results_by_candidate.json > data/categorized.json
