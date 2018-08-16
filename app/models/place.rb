class Place < ApplicationRecord
	belongs_to :event
	belongs_to :company
end
