#!/bin/env ruby
require 'mechanize'

mechanize = Mechanize.new
page = mechanize.get('http://wahlen.dresden.de/2015/OBW/index.html')

results = []

page.links_with(:href => /uebersicht_direktwahl_wahlbezirk/).each do |wahlbezirk_link|
  wahlbezirk = wahlbezirk_link.click

  results.push({
    "name" => wahlbezirk.at("h2").text,
    "results" => {
      "ulbig" => wahlbezirk.at("table.ui-chart-content tr:nth(1) span").text.sub!(',','.').to_f,
      "vogel" => wahlbezirk.at("table.ui-chart-content tr:nth(2) span").text.sub!(',','.').to_f,
      "festerling" => wahlbezirk.at("table.ui-chart-content tr:nth(3) span").text.sub!(',','.').to_f,
      "stange" => wahlbezirk.at("table.ui-chart-content tr:nth(4) span").text.sub!(',','.').to_f,
      "stosch" => wahlbezirk.at("table.ui-chart-content tr:nth(5) span").text.sub!(',','.').to_f,
      "hilbert" => wahlbezirk.at("table.ui-chart-content tr:nth(6) span").text.sub!(',','.').to_f
    }
  })
end

puts results.to_json
