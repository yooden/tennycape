class Address < ActiveRecord::Base
  attr_accessible :city, :country, :street, :zip
end
