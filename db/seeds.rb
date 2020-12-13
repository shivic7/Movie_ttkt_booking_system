# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

movies = Movie.create([{ name: 'Star Wars', image_url: "https://image.tmdb.org/t/p/w780/bOGkgRGdhrBYJSLpXaxhXVstddV.jpg", is_active: 1}, { name: 'Avengers', image_url: "https://image.tmdb.org/t/p/w154/bvYjhsbxOBwpm8xLE5BhdA3a8CZ.jpg", is_active: 1}, { name: 'Intersteller', image_url: "http://image.tmdb.org/t/p/w185/nBNZadXqJSdt05SHLqgT0HuC5Gm.jpg", is_active: 1}, { name: 'Aquaman', image_url: "https://m.media-amazon.com/images/M/MV5BOTk5ODg0OTU5M15BMl5BanBnXkFtZTgwMDQ3MDY3NjM@._V1_QL50_SY1000_CR0,0,674,1000_AL_.jpg",is_active: 1}])

movie_details = MovieDetail.create([{ movie_id: 19, movie_date: "2020-12-12", movie_time: '12-3',first_class_seat: 30, second_class_seat: 40, third_class_seat: 30},{ movie_id: 19, movie_date: "2020-12-12", movie_time: '4-7',first_class_seat: 30, second_class_seat: 40, third_class_seat: 30},{ movie_id: 19, movie_date: "2020-12-12", movie_time: '8-11',first_class_seat: 30, second_class_seat: 40, third_class_seat: 30},{ movie_id: 20, movie_date: "2020-12-13", movie_time: '12-3',first_class_seat: 30, second_class_seat: 40, third_class_seat: 30},{ movie_id: 20, movie_date: "2020-12-13", movie_time: '4-7',first_class_seat: 30, second_class_seat: 40, third_class_seat: 30},{ movie_id: 20, movie_date: "2020-12-13", movie_time: '8-11',first_class_seat: 30, second_class_seat: 40, third_class_seat: 30},{ movie_id: 21, movie_date: "2020-12-14", movie_time: '12-3',first_class_seat: 30, second_class_seat: 40, third_class_seat: 30},{ movie_id: 21, movie_date: "2020-12-14", movie_time: '4-7',first_class_seat: 30, second_class_seat: 40, third_class_seat: 30},{ movie_id: 21, movie_date: "2020-12-14", movie_time: '8-11',first_class_seat: 30, second_class_seat: 40, third_class_seat: 30},{ movie_id: 22, movie_date: "2020-12-15", movie_time: '12-3',first_class_seat: 30, second_class_seat: 40, third_class_seat: 30},{ movie_id: 22, movie_date: "2020-12-15", movie_time: '4-7',first_class_seat: 30, second_class_seat: 40, third_class_seat: 30},{ movie_id: 22, movie_date: "2020-12-15", movie_time: '8-11',first_class_seat: 30, second_class_seat: 40, third_class_seat: 30}])

admin = Admin.create([{email: 'test@gmail.com', password: 'testing'}])
