class Classroom < ApplicationRecord
  has_many :students

  validates :name, :presence => true,
            :length => { :minimum => 1, :maximum => 20 },
            :uniqueness => true
end
