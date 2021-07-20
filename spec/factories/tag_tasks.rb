FactoryBot.define do
  factory :tag_task_user, class: 'User' do
    email { "no.admin@gmail.com" }
    password { "password" }
    admin {false}
  end
  
  factory :tag_task, class: 'Tag' do
    name { 'undefined_title' }
    details { 'undefined_content' }
    deadline {'17/07/2021'}
    status {'unstarted'}
    priority {2}
    association :user
  end

  factory :third_tag, class: Tag do
    name { "Tag Y" }
  end

  def task_with_tag
    FactoryBot.create(:task) do |task|
      FactoryBot.create(:tag, task: task)
    end
  end
end
