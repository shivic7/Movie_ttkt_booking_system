require 'rails_helper'
RSpec.describe MovieDetail, type: :model do
  it "returns ticket fare" do
    fare_list = [650, "Ticket booked successfully.", 3]
    movies = Movie.create([{ name: 'Star Wars', image_url: "https://image.tmdb.org/t/p/w780/bOGkgRGdhrBYJSLpXaxhXVstddV.jpg", is_active: 1}]).last
    mv_dtl = MovieDetail.create([{ movie_id: movies.id, movie_date: "2020-12-12", movie_time: '12-3',first_class_seat: 30, second_class_seat: 40, third_class_seat: 30}])
    expect(MovieDetail.get_amount({movie_id: movies.id, movie_date: "2020-12-12", movie_time: '12-3', mfcs: 1, mscs: 1, mtcs: 1})).to eql (fare_list)
  end

  it "verify edit movie" do
  	movies = Movie.create([{ name: 'Star Wars', image_url: "https://image.tmdb.org/t/p/w780/bOGkgRGdhrBYJSLpXaxhXVstddV.jpg", is_active: 1}]).last
    mv_dtl = MovieDetail.create([{ movie_id: movies.id, movie_date: "2020-12-12", movie_time: '12-3',first_class_seat: 30, second_class_seat: 40, third_class_seat: 30}])
    expect(MovieDetail.edit_movie({'mname'=>'testing',"movie_detail_id"=> mv_dtl.first.id},movies, mv_dtl)).to eql true
  end
end

