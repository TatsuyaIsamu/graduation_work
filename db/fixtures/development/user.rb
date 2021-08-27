# 100.times do |i|
#   User.seed(
#     :id,
#     { id: i, name: Faker::Name.name, email: Faker::Internet.email, password: 'password' },
#   )
#   rand = rand(1..47)
#   UserIntroduction.seed(
#     :id,
#     {
#       id: i,
#       user_id: i,
#       image: "",
#       address: rand,
#       introduction: Faker::JapaneseMedia::StudioGhibli.quote,  
#     }
#   )
#   3.times do |n|
#     Ranking.seed(
#       :id,{
#         id: i*3+n+1,
#         rank: n+1,
#         user_id: i
#       }
#     )
#     shinto_rand = rand(1..100)
#     RankingItem.seed(
#       :id , {
#         id: i*3+n+1,
#         ranking_id: i*3+n+1,
#         memo: Faker::JapaneseMedia::StudioGhibli.quote,
#         shinto_id: shinto_rand
#       }
#     )
#   end
# end

