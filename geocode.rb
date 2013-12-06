require 'rubygems'
require 'rest-client'
require 'crack'

def find_geo(addr)
   base_google_url = "http://maps.googleapis.com/maps/api/"+
   									 "geocode/xml?sensor=false&address="

   res = RestClient.get(URI.encode("#{base_google_url}#{addr}"))
   parsed_res = Crack::XML.parse(res)

   lat = parsed_res["GeocodeResponse"]["result"]["geometry"]["location"]["lat"]
   lng = parsed_res["GeocodeResponse"]["result"]["geometry"]["location"]["lng"]

   return "#{lat},#{lng}"
 end

def init_map(find_geo)
	base_google_url = "http://maps.googleapis.com/maps/api/staticmap?"+
										"sensor=false&size=400x400&zoom=15&markers="
   
  return "#{base_google_url}#{find_geo}"
end

puts 

puts "Enter an address"


geo= find_geo(gets.chomp)

puts "Your coordinates are: #{geo}"
puts init_map(geo)