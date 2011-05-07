class Genre < ActiveRecord::Base
  attr_accessible :name
  
  validates_presence_of :name
  
  has_many :films, :dependent => :destroy
  
end

# == Schema Information
#
# Table name: genres
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

