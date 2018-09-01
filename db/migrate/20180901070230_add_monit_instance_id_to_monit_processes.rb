class AddMonitInstanceIdToMonitProcesses < ActiveRecord::Migration[5.2]
  def change
  	add_column :monit_processes, :monit_instance_id, :integer
  end
end
