# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)






contributor1 =  Contributor.new(username: 'alex10', email: 'alex10@nk.com', password: '123456', bio: 'imgoodman lmao hahahaha')
contributor1.save

region1 =  Region.new(name: 'Southeast Asia', photomap: '14.00 12.00 LT UZZ')
region1.save

greet1 = Greeting.new(contributor: contributor1, region: region1, word: 'Halo', story: "Indonesian phone greeting", audio: "audio-sample.com/halo")
greet1.save

rand(1..[2, 3, 4].sample).times do
  photo = Photo.new(greeting: greet1, description: 'alpha beta charlie')
  photo.save
end

greet2 = Greeting.new(contributor: contributor1, region: region1, word: 'Selamat', story: "Indonesian greeting prefix", audio: "audio-sample.com/selamat")
greet2.save

rand(1..[2, 3].sample).times do
  photo = Photo.new(greeting: greet2, description: 'alpha beta omega six haha')
  photo.save
end

contributor2 = Contributor.new(username: 'nilsson_du', email: 'koshi@nk.com', password: '123456', bio: "y'all funny hahahaha")
contributor2.save

region2 =  Region.new(name: 'Scandinavia', photomap: '/23131234axcv')
region2.save

greet3 = Greeting.new(contributor: contributor2, region: region2, word: 'Hej sa', story: "Swedish intimate greeting", audio: "audio-sample.com/hejsa")
greet3.save

rand(1..[2, 3].sample).times do
  photo = Photo.new(greeting: greet3, description: 'det ar sjugo-fem lmao')
  photo.save
end

=begin
greet = Greeting.new(contributor: contributor1, word: 'Halo', story: "Indonesian phone greeting", audio: "audio-sample.com/halo")
greet.save


greet = Greeting.new(word: 'Hej', story: "Swedish basic greeting", audio: "audio-sample.com/halo")
greet.save

greet = Greeting.new(word: 'Hej Sa', story: "Swedish more intimate greeting", audio: "audio-sample.com/halo")
greet.save

greet = Greeting.new(word: 'Wilujeng', story: "Sundanese greeting prefix", audio: "audio-sample.com/halo")
greet.save

greet = Greeting.new(word: 'Matur Nuwun', story: "Javanese way of saying thank you", audio: "audio-sample.com/halo")
greet.save
=end