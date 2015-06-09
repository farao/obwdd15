#!/bin/env ruby

require 'json'

output_html = """
<html>
<head>
  <meta charset=\"utf-8\">
  <title>Resultate der OB-Wahl 2015 in Dresden nach Kandidat sortiert</title>
  <script src=\"//code.jquery.com/jquery-1.11.3.min.js\"></script>
  <script src=\"//code.jquery.com/jquery-migrate-1.2.1.min.js\"></script>
  <script>function select(candidate) {
    $('.candidate').hide();
    $('#' + candidate).show();
    $('.candidate_link').css('text-decoration', 'none').css('font-weight', 'normal');
    $('#' + candidate + '_link').css('text-decoration', 'underline').css('font-weight', 'bold');
  }
  </script>
  <style>
  body { text-align: center }
  table { margin: 3em auto }
  ul { font-size: 11pt; list-style-type: none; line-height: 1.5em;}
  li { display: inline; margin: 1em; }
  a { text-decoration: none }
  </style>
</head>
<body>
<h1>Wahlergebnisse der Oberbürgermeisterwahl 2015</h1>
"""

candidates = {
  "ulbig" => "Markus Ulbig (CDU)",
  "vogel" => "Stefan Vogel (AfD)",
  "festerling" => "Tatjana Festerling (pegida)",
  "stange" => "Eva-Maria Stange (Gemeinsam für Dresden)",
  "stosch" => "Lara Liqueur (PARTEI)",
  "hilbert" => "Dirk Hilbert (FDP)"
}

results = JSON.parse(gets(nil))

candidates_html = "<ul>"
data_html = ""

for candidate, area_results in results
  candidates_html << "<li><a href=\"#\" id='#{candidate}_link' class='candidate_link' onclick=\"select('#{candidate}')\">#{candidates[candidate]}</a></li>"
  data_html << "<table hidden id=\"#{candidate}\" class=\"candidate\"><tr><th>Wahlkreis</th><th>Stimmenanteil</th></tr>"
  for entry in area_results
    data_html << "<tr>"
    data_html << "<td>#{entry["name"]}</a></td>"
    data_html << "<td>#{entry["value"]}%</td>"
    data_html << "</tr>"
  end
  data_html << "</table>"
end

candidates_html << "</ul>"

output_html << candidates_html + data_html + "</body></html>"

puts output_html
