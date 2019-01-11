require 'http'

system "clear"

puts "Welcome to the Dictionary App"
puts ""

print "Enter a word: "
input_word = gets.chomp

width = 80


response_def = HTTP.get("https://api.wordnik.com/v4/word.json/#{input_word}/definitions?limit=10&includeRelated=false&useCanonical=false&includeTags=false&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")
response_pro = HTTP.get("https://api.wordnik.com/v4/word.json/#{input_word}/pronunciations?useCanonical=false&limit=1&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

response_exam = HTTP.get("https://api.wordnik.com/v4/word.json/#{input_word}/topExample?useCanonical=false&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

definitions = response_def.parse
pronunciations = response_pro.parse
top_examples = response_exam.parse

list_number = 1

puts " "
puts input_word.upcase.center(width)
puts " "

pronunciations.each do |pronunciation|
  puts "Pronounced: #{pronunciation["raw"]}".center(width)
  puts " "
end

puts "Definitions".center(width)
puts "=" * width

definitions.each do |definition|
  puts "#{list_number} - #{definition["text"]}"
  puts " "
  list_number += 1
end

puts "EXAMPLE:".center(width)
puts "=" * width
puts " "
puts "#{top_examples["text"]}"
puts " "



