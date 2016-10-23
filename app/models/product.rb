class Product < ActiveRecord::Base
  belongs_to :user

  attr_accessible :name, :user_id

  validates_presence_of :name, :user_id

  validates_exclusion_of :user_id, in: User.where(admin: false).map!(&:id)

  def self.for user
    unless user.try :admin?
      user.products
    else
      self
    end
  end
end
