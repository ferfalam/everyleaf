FactoryBot.define do
  factory :tag do
    name { "Tag Z" }
  end
  factory :second_tag, class: Tag do
    name { "Tag W" }
  end
end
