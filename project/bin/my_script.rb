require 'addressable/uri'
require 'rest-client'

puts "would you like to get(1), show(2), create(3), update_CAREFULLY(4), annihilate_at_will(5)"
input = gets.chomp.to_i

case input
when 1
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

  puts RestClient.get(url)

when 2

  puts "What user id?"
  id = gets.chomp
    url = Addressable::URI.new(
      scheme: 'http',
      host: 'localhost',
      port: 3000,
      path: "/users/#{id}.json"
    ).to_s

    puts RestClient.get(url)

when 3
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

  puts "name, email"
  input = gets.chomp.split(",").map(&:strip)

  puts RestClient.post(url,
    { user: { name: input[0], email: input[1]} }
  )

when 4
  puts "What user id?"
  id = gets.chomp
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: "users/#{id}.json"
  ).to_s

  puts "name, email"
  input = gets.chomp.split(",").map(&:strip)

  puts RestClient.patch(url,
    { user: { name: input[0], email: input[1]} }
  )

when 5
  puts "What user id?"
  id = gets.chomp

  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: "users/#{id}.json"
  ).to_s

  puts RestClient.delete(url)
end
