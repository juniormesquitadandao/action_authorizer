class Country::City < ActiveRecord::Base
  validates_presence_of :name
end
