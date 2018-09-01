require 'nokogiri'
require 'csv'
require 'net/http'
require 'openssl'

uri = URI('http://localhost:2812/sivas-MacBook-Air-2.local')

Net::HTTP.start(uri.host, uri.port, :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|
  request = Net::HTTP::Get.new uri.request_uri
  request.basic_auth 'admin', 'monit'
  response = http.request request
  doc = Nokogiri::HTML(response.body)
	tables = doc.search('table')

	skip_tables = 1
	tables.search('tr').each_with_index do |row, index|
		next if index < skip_tables
	  cells = row.search('th, td').map { |cell| cell.text.strip }
	  p cells 
	  # puts CSV.generate_line(cells)
	end
end

