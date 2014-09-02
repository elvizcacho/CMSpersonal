class Menu < ActiveRecord::Base
	belongs_to(:usuario)
	has_many(:campos_menu)
end
