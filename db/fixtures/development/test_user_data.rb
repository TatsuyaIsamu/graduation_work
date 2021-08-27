
# フォロー

# user_id = [*1..100]

# 50.times do |i|
#   rand = rand(1..99-i) + 1
#   if rand <= 0
#       rand = rand + i + 1
#   end
#   rand_id = user_id.slice!(rand)

#   Relationship.seed(
#     :id,{
#       id: i+1,
#       follower_id: rand_id,
#       followed_id: 100
#     },
#   )
# end

# 神社のお気に入り

# shinto_id = [*1..100]

# 50.times do |i|
#   rand = rand(1..99-i) + 1
#   if rand <= 0
#       rand = rand + i + 1
#   end
#   rand_id = shinto_id.slice!(rand)

#   FavoriteShinto.seed(
#     :id,{
#       id: i+1,
#       shinto_id: rand_id,
#       user_id: 100
#     },
#   )
#   ShintoParam.seed(
#     :id,{
#       id: i+1,
#       favorite_shinto_id: i+1,
#       title: Faker::JapaneseMedia::StudioGhibli.quote,
#       points: rand(1..6),
#       memo: Faker::Restaurant.name
#     }
#   )
# end

# 参拝

# 200.times do |n|
#   shinto_rand = rand(1..100)
#   worshipday_rand = rand(1..1000)
#   weather_rand = rand(1..3)
#   Worship.seed(
#     :id, {
#       id: n + 1,
#       user_id: 100,
#       shinto_id: shinto_rand,
#       worship_day: Date.today - worshipday_rand,
#       weather: weather_rand,
#       image: "",
#       memo: Faker::JapaneseMedia::StudioGhibli.quote
#     }
#   )
#   WorshipParam.seed(
#     :id, {
#       id: n + 1,
#       worship_id: n + 1,
#       title: Faker::Restaurant.name,
#       points: rand(1..5),
#       memo: Faker::JapaneseMedia::StudioGhibli.quote
#     }
#   )
# end
