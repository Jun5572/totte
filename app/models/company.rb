class Company < ApplicationRecord
	attachment :image

	has_many :events
	has_one :place
end
