class AddMonitSystemIdToMonitInstances < ActiveRecord::Migration[5.2]
  def change
  	add_column :monit_instances, :monit_system_id, :integer
  end
end
