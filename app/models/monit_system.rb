class MonitSystem < ApplicationRecord
	has_many :monit_instances
	has_many :user_monit_systems
	has_many :users, through: :user_monit_systems
	def self.scrape_and_create_system url=nil, username, password
		require 'nokogiri'
		require 'net/http'
		require 'openssl'

		uri = URI(url)
		monit_system_params = {}
		white_listed_params = self.column_names
		Net::HTTP.start(uri.host, uri.port, :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|
		  request = Net::HTTP::Get.new uri.request_uri
		  request.basic_auth username, password
		  response = http.request request
		  doc = Nokogiri::HTML(response.body)
			tables = doc.search('table')

			skip_tables = 2
			tables.search('tr').each_with_index do |row, index|
				next if index < skip_tables
			  cells = row.search('th, td').map { |cell| cell.text.strip }
			  parameter = cells[0].downcase.gsub(' ','_').gsub('/','_')
			  monit_system_params[parameter] = cells[1] if white_listed_params.include? parameter
			end
		end

		existing_monit_system = MonitSystem.where(name: monit_system_params['name'])
		if existing_monit_system.present?
			return existing_monit_system.first
		else
			return MonitSystem.create(monit_system_params)
		end
	end
end
