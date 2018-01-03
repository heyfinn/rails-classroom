class Student < ApplicationRecord
  validates_format_of :email, :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i

  validates :first_name, :presence => true,
                         :length => { :minimum => 1, :maximum => 20 }

  validates :last_name, :presence => true,
                        :length => { :minimum => 1, :maximum => 20 }
  
  validates :email, :presence => true,
                    :length => { :minimum => 5, :maximum => 254 },
                    :uniqueness => true
                    # :email_format => true
end
