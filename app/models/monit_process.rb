class MonitProcess < ApplicationRecord
	belongs_to :monit_instance

	def self.scrape_and_create_monit_process url=nil, monit_instance_id=nil, username, password
		require 'nokogiri'
		require 'net/http'
		require 'openssl'
		
		uri = URI(url)
		monit_process_params = {}
		monit_process_params['monit_instance_id'] = monit_instance_id
		white_listed_params = self.column_names
		Net::HTTP.start(uri.host, uri.port, :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|
		  request = Net::HTTP::Get.new uri.request_uri
		  request.basic_auth username, password
		  response = http.request request
		  doc = Nokogiri::HTML(response.body)
			tables = doc.search('table')
			
			table = tables[1]
			table.search('tr').each do |row|
				cells = row.search('th, td').map{ |cell| cell.text.strip}
				parameter = cells[0].downcase.gsub(' ','_').gsub('/','_')
			  monit_process_params[parameter] = cells[1] if white_listed_params.include? parameter
			end
		end
		MonitProcess.create(monit_process_params)
	end
end