class Tag < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_many :tag_task, dependent: :destroy
end
