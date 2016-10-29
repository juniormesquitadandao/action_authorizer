class User < ActiveRecord::Base
  has_many :products, dependent: :restrict

  validates_presence_of :name

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def to_s
    "#{name} (#{email})"
  end

  def self.for user
    if user && user.admin?
      where("id <> #{user.id}").all
    else
      []
    end
  end
end
