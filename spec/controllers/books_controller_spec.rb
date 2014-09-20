require 'spec_helper'

describe BooksController do
  it "should be an ApplicationController child" do
		expect(BooksController.superclass).to eq(ApplicationController)
	end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end

    it "assigns @book variable to the new.hml.erb view" do
      get 'new'
      expect(assigns[:book]).to be_a_new(Book)
    end

    it "renders new.html.erb" do
      get 'new'
      expect(response).to render_template(:new)
    end
  end

  describe "GET 'create'" do
    it "should not return http success" do
       get 'create'
       response.should_not be_success
    end

    it "should return http success" do
      post 'create'
      response.should_not be_success
    end

    it "assigns a newly created book as @book" do
      post :create, {:book => FactoryGirl.attributes_for(:book)}
      assigns(:book).should be_a(Book)
      assigns(:book).should be_persisted
    end
  end
end