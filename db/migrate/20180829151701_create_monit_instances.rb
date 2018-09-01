class CreateMonitInstances < ActiveRecord::Migration[5.2]
  def change
    create_table :monit_instances do |t|
      t.string :monit_id
      t.string :host
      t.string :process_id
      t.string :effective_user_running_monit
      t.string :controlfile
      t.string :logfile
      t.string :pidfile
      t.string :state_file
      t.string :debug
      t.string :log
      t.string :use_syslog
      t.string :limit_for_send_expect_buffer
      t.string :limit_for_file_content_buffer
      t.string :limit_for_http_content_buffer
      t.string :limit_for_program_output
      t.string :limit_for_network_timeout
      t.string :limit_for_check_program_timeout
      t.string :limit_for_service_stop_timeout
      t.string :limit_for_service_start_timeout
      t.string :limit_for_service_restart_timeout
      t.string :on_reboot
      t.string :poll_time
      t.string :httpd_bind_address
      t.string :httpd_portnumber
      t.string :httpd_signature
      t.string :httpd_auth_style            
    end
  end
end
