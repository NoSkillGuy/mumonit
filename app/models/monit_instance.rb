class MonitInstance < ApplicationRecord
	belongs_to :monit_system
	has_many :monit_processes
	def self.scrape_and_create_monit url=nil, monit_system_id=nil
		require 'nokogiri'
		require 'net/http'
		require 'openssl'
		
		uri = URI(url)
		monit_instance_params = {}
		monit_instance_params['monit_system_id'] = monit_system_id
		white_listed_params = self.column_names
		Net::HTTP.start(uri.host, uri.port, :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|
		  request = Net::HTTP::Get.new uri.request_uri
		  request.basic_auth 'admin', 'monit'
		  response = http.request request
		  doc = Nokogiri::HTML(response.body)
			tables = doc.search('table')
			
			table = tables[1]
			skip_rows = 1
			table.search('tr').each_with_index do |row,index|
				next if index < skip_rows
				cells = row.search('th, td').map{ |cell| cell.text.strip}
				parameter = cells[0].downcase.gsub(' ','_').gsub('/','_')
			  monit_instance_params[parameter] = cells[1] if white_listed_params.include? parameter
			end
		end
		existing_monit_instance = MonitInstance.where(monit_id: monit_instance_params['monit_id'])
		if existing_monit_instance.present?
			return existing_monit_instance.first
		else
			return MonitInstance.create(monit_instance_params)
		end
	end
end