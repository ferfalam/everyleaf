FactoryBot.define do
    factory :task do
      name { 'undefined_title' }
      details { 'undefined_content' }
    end

    factory :second_task, class: Task do
        name { 'Task B' }
        details { 'Details B' }
    end
end