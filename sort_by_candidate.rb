#!/bin/env ruby

require 'json'

results = {
  "ulbig" => [],
  "vogel" => [],
  "festerling" => [],
  "stange" => [],
  "stosch" => [],
  "hilbert" => []
}

while line = gets
  wahlbezirk = JSON.parse(line)

  for candidate, value in wahlbezirk["results"]
    results[candidate] << {"name" => wahlbezirk["name"], "value" => value}
  end
end

for candidate, _values in results
  results[candidate].sort! {|a,b| (a["value"] <=> b["value"]) * (-1)}
end

puts results.to_json
