class Usuario < ActiveRecord::Base
	has_one(:admin)
	has_one(:menu)
	has_one(:jumbotron)
	has_one(:thumbnail_group)
end
