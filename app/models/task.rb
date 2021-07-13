class Task < ApplicationRecord
    validates :name, presence:true, length: {minimum:1, maximum:30}
end
