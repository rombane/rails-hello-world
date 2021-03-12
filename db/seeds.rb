# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
GALLERY_LIST = ['charlie_lademp', 'beta_ygc2jh', 'alpha_mhwcr2', 'echo_ubkclo', 'delta_kxtz4g']

PRODUCT_PIC = ['alpha', 'beta', 'charlie', 'delta', 'echo']
8.times do
  puts 'generating items'
  item = Item.create(nama_barang:"#{Faker::Computer.platform} #{Faker::Hacker.ingverb} #{Faker::Hacker.noun}", no_sku: (rand(1000..4999) + rand(1000..4999)).to_s , qty: 15, harga_satuan: rand(10..45)*500)
  
  file = open("https://res.cloudinary.com/rombane/image/upload/v1615458011/hello_world_photo/#{GALLERY_LIST.sample}.jpg")
  item.foto_barang.attach(io: file, filename: "itempic_#{item.id}.jpg")
end
 
rand(4..10).times do 
  puts 'generating users'
  user = User.create(name: Faker::Name.name , email: Faker::Internet.email, password: 'password')

  puts 'generating purchase'
  
  purchase = Purchase.create(user: user)


  purchased_items = Item.all.sample(rand(2..5))
  puts purchased_items
  puts 'generating batch'
  purchased_items.each do |item|
    Batch.create!(purchase: purchase, item: item, batch_name: item.nama_barang, batch_qty: rand(1..3))
  end

  
end 

