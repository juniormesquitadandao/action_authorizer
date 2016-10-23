class User < ActiveRecord::Base
  has_many :products, dependent: :restrict

  attr_accessible :name, :admin

  validates_presence_of :name

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  def to_s
    "#{name} (#{email})"
  end
end
