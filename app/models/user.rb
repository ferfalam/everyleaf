class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    validates :password, length: { minimum: 6 }

    has_secure_password
    has_many :tasks, dependent: :destroy

    before_save :change_role

    private
    def change_role
        if self.admin  
            unless User.where(admin: true).count == 1  
                self.admin = !self.admin
            end
        else
            self.admin = !self.admin
        end
    end
    
end
