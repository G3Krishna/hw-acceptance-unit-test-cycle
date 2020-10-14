require 'rails_helper'

RSpec.describe Movie, type: :model do
  require 'rails_helper'



describe Movie do
    describe :get_similar_directors do
        let!(:mv1) { FactoryGirl.create(:movie, id: 1, title: 'A', director: 'abc') }
        let!(:mv2) { FactoryGirl.create(:movie, id: 2, title: 'B', director: 'abc') }
        let!(:mv3) { FactoryGirl.create(:movie, id: 3, title: "C", director: 'def') }
        
        it 'should find movies by same directors' do
            expect(Movie.get_similar_directors(mv1.director)).to include(mv1.title,mv2.title)
        end
        
        it 'should not find movies by different directors' do
            expect(Movie.get_similar_directors(mv1.director)).to_not include([mv3.title])
        end
    end
end
end