class Page < ApplicationRecord
	belongs_to :subject 
	has_many :sections
	has_and_belongs_to_many :admin_users
#where you dnt use default foreign key name use this syntax to
#specify {foreign_key => 'key_name'}
end
