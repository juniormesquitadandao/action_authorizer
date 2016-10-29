class Product < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name, :user_id

  validate :user_id_reserved

  def self.for user
    if user && !user.admin?
      user.products.all
    else
      all
    end
  end

  private

  def user_id_reserved
    errors.add(:user_id, :exclusion) if user.try(:reload).try(:admin?)
  end
end
