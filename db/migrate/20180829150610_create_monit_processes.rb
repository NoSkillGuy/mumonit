class CreateMonitProcesses < ActiveRecord::Migration[5.2]
  def change
    create_table :monit_processes do |t|
      t.string :name
      t.string :pid_file
      t.string :status
      t.string :group
      t.string :monitoring_status
      t.string :monitoring_mode
      t.string :on_reboot
      t.string :pid
      t.string :parent_pid
      t.string :uid
      t.string :effective_uid
      t.string :gid
      t.string :uptime
      t.string :threads
      t.string :children
      t.string :cpu
      t.string :cpu_total
      t.string :memory
      t.string :memory_total
      t.string :data_collected    
      t.timestamps  
    end
  end
end
