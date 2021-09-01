
# フォロー

user_id = [*1..100]

50.times do |i|
  rand = rand(1..99-i) + 1
  if rand <= 0
      rand = rand + i + 1
  end
  rand_id = user_id.slice!(rand)

  Relationship.seed(
    :id,{
      id: i+1,
      follower_id: rand_id,
      followed_id: 100
    },
  )
end

# 神社のお気に入り

shinto_id = [*1..101]

50.times do |i|
  rand = rand(1..99-i) + 1
  if rand <= 0
      rand = rand + i + 1
  end
  rand_id = shinto_id.slice!(rand)

  FavoriteShinto.seed(
    :id,{
      id: i+1,
      shinto_id: rand_id,
      user_id: 100
    },
  )
  ShintoParam.seed(
    :id,{
      id: i+1,
      favorite_shinto_id: i+1,
      title: Faker::JapaneseMedia::StudioGhibli.quote,
      points: rand(1..6),
      memo: Faker::Restaurant.name
    }
  )
end

# 参拝

200.times do |n|
  shinto_rand = rand(1..101)
  worshipday_rand = rand(1..1000)
  weather_rand = rand(1..3)
  Worship.seed(
    :id, {
      id: n + 1,
      user_id: 100,
      shinto_id: shinto_rand,
      worship_day: Date.today - worshipday_rand,
      weather: weather_rand,
      image: "",
      memo: Faker::JapaneseMedia::StudioGhibli.quote
    }
  )
  WorshipParam.seed(
    :id, {
      id: n + 1,
      worship_id: n + 1,
      title: Faker::Restaurant.name,
      points: rand(1..5),
      memo: Faker::JapaneseMedia::StudioGhibli.quote
    }
  )
end

# 会話

user_id = [*1..100]

99.times do |n|
  user_rand = rand(1..99 - n) + 1
  if rand <= 0
    rand = user_rand + n + 1
  end
  rand_id = user_id.slice!(user_rand)
  conversation_user = [100, rand_id]
  Conversation.seed(
    :id, {
      id: n+1,
      sender_id: 100,
      recipient_id: rand_id,
    }
  )
  40.times do |s|
    Message.seed(
      :id, {
        id: n*10+s+1,
        body: Faker::JapaneseMedia::StudioGhibli.quote,
        user_id: conversation_user[rand(2)],
        conversation_id: n+1
      }
    )
  end
end


