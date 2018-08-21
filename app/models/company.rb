class Company < ApplicationRecord
	attachment :thumbnail

	has_many :events
	has_one :place
end
