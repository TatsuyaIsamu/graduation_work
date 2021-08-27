
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

