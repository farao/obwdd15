#!/bin/env ruby

require 'json'

results = JSON.parse(gets(nil))

output = {}

for candidate, arearesults in results
  output[candidate] = [ [],[],[],[],[] ]

  min = arearesults.last["value"]
  max = arearesults.first["value"]
  diff = max - min
  category_width = diff / 5

  arearesults.each do |arearesult|
    category = ((arearesult["value"] - min) / category_width).ceil
    category = 1 if category == 0
    output[candidate][category-1] << arearesult
  end
end

puts output.to_json
