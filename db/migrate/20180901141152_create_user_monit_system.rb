class CreateUserMonitSystem < ActiveRecord::Migration[5.2]
  def change
  	create_table :user_monit_systems do |t|
  		t.integer :user_id
  		t.integer :monit_system_id
  	end
  end
end
