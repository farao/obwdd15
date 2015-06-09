#!/bin/bash

chmod a+x get_data.rb

echo -n "[" > out/result_by_area.json
./get_data.rb >> out/result_by_area.json
echo -n "]" > out/result_by_area.json
