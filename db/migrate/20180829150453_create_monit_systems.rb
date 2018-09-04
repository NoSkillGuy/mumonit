class CreateMonitSystems < ActiveRecord::Migration[5.2]
  def change
    create_table :monit_systems do |t|
      t.string :name
      t.string :status
      t.string :monitoring_status
      t.string :monitoring_mode
      t.string :on_reboot
      t.string :load_average
      t.string :cpu
      t.string :memory_usage
      t.string :swap_usage
      t.string :uptime
      t.string :boot_time
      t.string :data_collected
      t.timestamps
    end
  end
end
