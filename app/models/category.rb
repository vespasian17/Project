class Category < ApplicationRecord
	has_many :instructions
	validates :name, presence: true
end
