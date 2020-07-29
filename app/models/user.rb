class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Currently using devise gem so these lines are no need
  #has_secure_password 
  #validates_presence_of :username
  #validates_presence_of :password
  #validates_uniqueness_of :username
end
