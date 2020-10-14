require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
    describe 'GET similar_directors' do 
    it "should get called with apt parameters" do
        mv1 = Movie.new
        mv2 = Movie.new
        fake_results=[mv1,mv2]
        director = "ABC"
        title = "Alien"
        
        Movie.should_receive(:get_similar_directors).with(director).and_return(fake_results)

        get :similar_directors, :director => director, :title => title
    end
    it "should render similar_directors with same director movies" do
        mv1 = double("movie 2")
        mv2 = double("movie 1")
        fake_results=[mv1,mv2]
        director = "ABC"
        title = "Alien"
       
        Movie.stub(:get_similar_directors).with(director).and_return(fake_results)

        get :similar_directors, :director => director, :title => title
        response.should render_template('similar_directors')
        
    end
        it "should redirect_to home page when no director" do
        title = "Alien"
        get :similar_directors, :director => nil, :title => title
        response.should redirect_to('/movies')
        
    end
    end
    
    describe "delete movie" do
        it "should destroy movie instance" do
            Movie.create(id: 1, title: "TestTitle", rating: "TestRating", description: "TestDesc", release_date: "1900")
            id_params = {id: 1}
            expect {
                delete :destroy, id_params}.to change(Movie, :count).by(-1)
        end
    end
    
    describe "create new movie" do
        it "should redirect to index page" do
            create_params = {"movie"=> {"title"=> "TestTitle", "rating"=> "TestRating", 
            "description"=> "TestDesc", "release_date"=> "1900"}}
            post :create, create_params
            expect(response).to redirect_to "/movies"
        end
    end
    
    describe "set edit page" do
        it "should set movie details in edit page" do
            Movie.create(id: 1, title: "TestTitle", rating: "TestRating", description: "TestDesc", release_date: "1900")
            id_params = {id: 1}
            get :edit, id_params
            expect(assigns(:movie)).to eq Movie.find 1
        end
    end
    
    describe "update movie" do
        it "should update movie's details" do
            Movie.create(id: 1, title: "TestTitle", rating: "TestRating", description: "TestDesc", release_date: "1900")
            update_params = {id: 1, "movie"=> {"title"=> "ChangeTitle", "rating"=> "ChangeRating", 
            "description"=> "ChangeDesc", "release_date"=> "1900"}}
            post :update, update_params
            expect(response).to redirect_to "/movies/1"
        end
    end



end
