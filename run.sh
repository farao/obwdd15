#!/bin/bash

chmod a+x get_data.rb
chmod a+x sort_by_candidate.rb
chmod a+x sorted_to_html.rb
chmod a+x categorize.rb

./get_data.rb | ./sort_by_candidate.rb > out/sorted.json
./sorted_to_html.rb < out/sorted.json > index.html
./categorize.rb < out/sorted.json > out/categorized.json
