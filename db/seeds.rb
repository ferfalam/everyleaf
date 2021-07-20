User.create(email: "john@example.com",password: "password",admin: true)
status = ['unstarted', 'progress', 'complete']

15.times do |n|
    User.create(
        email: Faker::Internet.unique.email,
        password: "password"
    )
end

10.times do |n|
    Tag.create(
        name: Faker::Lorem.word
    )
end

125.times do |n| 
    Task.create(
        name: Faker::Lorem.word,
        details: Faker::Lorem.sentence(word_count: 8),
        status: status[Faker::Number.between(from: 0, to: 2)],
        deadline: Faker::Date.between(from: '2021-07-21', to: '2021-12-31'),
        priority: Faker::Number.between(from: 0, to: 2),
        user_id: Faker::Number.between(from: 1, to: 16)
    )
end

180.times do |n|
    TagTask.create(
        task_id: Faker::Number.between(from: 1, to: 125),
        tag_id: Faker::Number.between(from: 1, to: 10)
    )
end