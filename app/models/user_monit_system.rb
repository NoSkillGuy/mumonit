class UserMonitSystem < ApplicationRecord
	belongs_to :user
	belongs_to :monit_system
end
