require "http"

response = HTTP.get("https://data.cityofchicago.org/resource/92xk-4rg9.json")

overtimes = response.parse




overtimes.each do |overtime|
  name = overtime["employee_name"]
  department = overtime["department_name"]
  jan_ot = overtime["jan_ot"]
end

  puts "#{name} works in #{department} and made #{jan_ot} overtime money in January"  

