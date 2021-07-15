class Task < ApplicationRecord
    validates :name, presence:true, length: {minimum:1, maximum:30}

    enum priority: {high:2, medium:1, low:0}
    def self.name_search(name)
        @task = Task.where(name: name)
    end

    def self.statut_search(status)
        @task = Task.where(status: status)
    end

    def self.name_statut_search(name, status)
        @task = Task.where("name LIKE ?", "%#{name}%").where(status: status)
    end
end
