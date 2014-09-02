class ThumbnailGroup < ActiveRecord::Base
	has_many(:thumbnail)
	belongs_to(:usuario)
end
