class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_sections, :dependent => :destroy 
  has_many :sections, :through => :user_sections
  #accepts_nested_attributes_for :usersections, :reject_if => lambda { |a| a[:user_id].blank?}, :allow_destroy => true      
end
