#!/bin/env ruby

require 'json'

output = {
  "ulbig" => [],
  "vogel" => [],
  "festerling" => [],
  "stange" => [],
  "stosch" => [],
  "hilbert" => []
}

results = JSON.parse(gets(nil))

results.each do |wahlbezirk|
  for candidate, value in wahlbezirk["results"]
    output[candidate] << {"name" => wahlbezirk["name"], "value" => value}
  end
end

for candidate, _values in output
  output[candidate].sort! {|a,b| (a["value"] <=> b["value"]) * (-1)}
end

puts output.to_json
