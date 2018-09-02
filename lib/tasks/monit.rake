require 'yaml'
namespace :monit do
	desc 'Polling from all monit services'
	task poll_from_all_services: :environment do
	  monit_config = YAML.load_file("#{Rails.root}/config/monit_config.yml")
		monit_config.each do |monit_host,monit_host_config|
			host_url = monit_host_config['host_url']
			username = monit_host_config['username']
			password = monit_host_config['password']
			monit_system = MonitSystem.scrape_and_create_system host_url+monit_host_config['monit_system_url'], username, password
			if monit_system.present?
				monit_instance = MonitInstance.scrape_and_create_monit host_url+monit_host_config['monit_url'], monit_system.id, username, password
				if monit_instance.present?
					monit_host_config['monit_process_urls'].each do |monit_process|
						monit_process = MonitProcess.scrape_and_create_monit_process host_url + monit_process, monit_instance.id, username, password
					end
				end
			end
		end
	end
end