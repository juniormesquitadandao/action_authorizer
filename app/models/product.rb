class Product < ActiveRecord::Base
  belongs_to :user

  attr_accessible :name, :user_id

  validates_presence_of :name, :user_id
end
