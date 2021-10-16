require 'csv'
# # インポートファイルを読み込む
def import_read( file_name )
  lines = CSV.read("db/#{file_name}")
  lines.unshift([])  # index 0番目は空行を入れてスキップさせる

  lines.each_with_index do |line, idx|
    next unless line.length > 0
    yield(line, idx) if block_given?
  end
end

# CSVファイルの取込
import_read('test_shinto.csv') do |line, idx|
  Shinto.create do |s|
    s.id      = idx
    s.name = line[1]
    s.image = line[2]
    s.address = line[3]
    s.origin_shrine = line[0]
    s.original_url = line[4]
    s.kamisama = line[5]
    s.origin_term = line[6]
    s.origin_history = line[7]
  end
end


User.seed(
  :id,
  { id: 1, name: "admin_user", email: "admin@gmail.com", admin: true, password: 'password' },
)

UserIntroduction.seed(
  :id,
  {
    id: 1,
    user_id: 1,
    address: 0, 
    introduction: Faker::JapaneseMedia::StudioGhibli.quote, 
  }
)
3.times do |n|
  Ranking.seed(
    :id,{
      id: n+1,
      rank: n+1,
      user_id: 1
    }
  )
  RankingItem.seed(
    :id , {
      id: n+1,
      ranking_id: n+1,
      shinto_id: n+1
    }
  )
end

20.times do |i|
  User.seed(
    :id,
    { id: i+2, name: Faker::Name.name, email: Faker::Internet.email, password: 'password' },
  )
  rand = rand(1..47)
  UserIntroduction.seed(
    :id,
    {
      id: i+2,
      user_id: i+2,
      address: rand,
      introduction: Faker::JapaneseMedia::StudioGhibli.quote,  
    }
  )
  3.times do |n|
    Ranking.seed(
      :id,{
        id: i*3+n+1+1,
        rank: n+1,
        user_id: i+2
      }
    )
    shinto_rand = rand(1..90)
    RankingItem.seed(
      :id , {
        id: i*3+n+1+3,
        ranking_id: i*3+n+1,
        memo: Faker::JapaneseMedia::StudioGhibli.quote,
        shinto_id: shinto_rand
      }
    )
  end
end

# フォロー

user_id = [*1..19]

10.times do |i|
  rand = rand(1..18-i) + 1
  if rand <= 0
      rand = rand + i + 1
  end
  rand_id = user_id.slice!(rand)

  Relationship.seed(
    :id,{
      id: i+1,
      follower_id: rand_id,
      followed_id: 1
    },
  )
end

# # # 神社のお気に入り

shinto_id = [*1..90]


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
      user_id: 1
    },
  )

  ShintoUserParam.seed(
    :id, {
      id: i + 1,
      user_id: rand(1..18),
      shinto_id: rand_id
    }
  )
  ShintoParam.seed(
    :id,{
      id: i+1,
      shinto_user_param_id: i + 1,
      memo: Faker::JapaneseMedia::StudioGhibli.quote
    }
  )
  ShintoParamItem.seed(
    :id, {
      id: i + 1,
      shinto_param_id: i + 1,
      title: Faker::Name.name,
      points: rand(1..4)
    }
  )
end

# # 参拝

50.times do |n|
  shinto_rand = rand(1..90)
  worshipday_rand = rand(1..1000)
  weather_rand = rand(1..3)
  Worship.seed(
    :id, {
      id: n + 1,
      user_id: 1,
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
  FavoriteWorship.seed(
    :id, {
      id: n + 1,
      user_id: rand(1..18),
      worship_id: n + 1
    } 
  )
  Comment.seed(
    :id, {
      id: n + 1,
      worship_id: n + 1,
      user_id: rand(1..18),
      comment: Faker::JapaneseMedia::StudioGhibli.quote
    }
  )
end


# # # 会話

user_id = [*1..18]

5.times do |n|
  user_rand = rand(1..18 - n) + 1
  if rand <= 0
    rand = user_rand + n + 1
  end
  rand_id = user_id.slice!(user_rand)
  conversation_user = [1, rand_id]
  Conversation.seed(
    :id, {
      id: n+1,
      sender_id: 1,
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

# お問い合わせ

5.times do |n|
  Contact.seed(
    :id, {
      id: n+1,
      name: "#{n}user",
      email: "#{n}email",
      content: "#{n}content"
    }
  )
end


