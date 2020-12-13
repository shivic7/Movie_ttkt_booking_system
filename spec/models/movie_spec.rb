RSpec.describe Movie, type: :model do
  it "verify add movie" do
    expect(Movie.new_movie({'mname'=>'testing',"mposter"=> 'abc', 'is_active' => 0, 'mdate' => Date.today, 'mslots' => '12-3,4-7,8-11'})).to eql nil
  end
end

