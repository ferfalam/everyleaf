FactoryBot.define do
    factory :task do
      name { 'undefined_title' }
      details { 'undefined_content' }
      deadline {'17/07/2021'}
      status {'unstarted'}
      priority {2}
      association :user, factory: :user
    end

    factory :second_task, class: Task do
        name { 'Task B' }
        details { 'Details B' }
        deadline {'17/07/2021'}
        status {'progress'}
        priority {0}
        association :user, factory: :user_admin
    end
end