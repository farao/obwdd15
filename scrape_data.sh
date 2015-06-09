#!/bin/bash

chmod a+x get_data.rb

echo -n "[" > data/results_by_area.json
./get_data.rb >> data/results_by_area.json
echo -n "]" >> data/results_by_area.json
