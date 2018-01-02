class Student < ApplicationRecord
  validates :first_name, :presence => true,
                         :length => { :minimum => 1, :maximum => 20 }
  validates :last_name, :presence => true,
                        :length => { :minimum => 1, :maximum => 20 }
  validates :email, :presence => true,
                    :uniqueness => true
                    :email => true
end
