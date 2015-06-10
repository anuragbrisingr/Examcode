class Section < ActiveRecord::Base
 has_many :questions,:dependent => :destroy
 has_many :user_sections
 accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank?}, :allow_destroy => true
end
