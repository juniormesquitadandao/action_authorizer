class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :group
  has_many :houses

  def to_s
    email
  end

  def user_group?
    group.name == 'user'
  end

  def admin_group?
    !user_group?
  end
end