5.times do 
  Article.create(title: Faker::Book.title, content: Faker::Lorem.sentence)
end