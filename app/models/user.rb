class User < ApplicationRecord
	has_many :user_monit_systems
	has_many :monit_systems, through: :user_monit_systems
end
