class Subject < ApplicationRecord
  #one to one relationship
  has_many :pages

	scope :descend,lambda{(order(:position => :desc))}
	scope :look,lambda{|query| where(["name LIKE ?","%#{query}%"])}
	scope :sort,lambda{(order("position ASC"))}
	
end
