class Product < ActiveRecord::Base
  belongs_to :user

  attr_accessible :name, :user_id

  validates_presence_of :name, :user_id

  validate :user_id_reserved

  def self.for user
    if user && !user.admin?
      user.products
    else
      self
    end
  end

  private

  def user_id_reserved
    errors.add(:user_id, :exclusion) if user.try(:reload).try(:admin?)
  end
end
