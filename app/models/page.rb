class Page < ActiveRecord::Base
  validates :permalink, presence: true, uniqueness: true


	def to_param
			permalink
	end
end
