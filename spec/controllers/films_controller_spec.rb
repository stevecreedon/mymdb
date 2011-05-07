require File.dirname(__FILE__) + '/../spec_helper'

describe FilmsController do
  fixtures :all
  render_views

  it "index action should render index template" do
    Film.expects(:all).returns([])
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    film = Factory(:film)
    Film.expects(:find).with(film.id).returns(film)
    get :show, :id => film.id
    response.should render_template(:show)
  end

  it "new action should render new template" do
    film = Factory.build(:film)
    Film.expects(:new).returns(film)
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    film = Factory.build(:film)
    Film.expects(:new).with('x' => 'x', 'y' => 'y').returns(film)
    film.expects(:save).returns(false)
    post :create, :film => {'x' => 'x', 'y' => 'y'}
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    film = Factory(:film)  #NOTE: we dpon't use Factory.build so that our film simulates a saved record with an id.
    film.stubs(:new_record?).returns(false)
    Film.expects(:new).with('x' => 'x', 'y' => 'y').returns(film)
    film.expects(:save).returns(true)
    post :create, :film => {'x' => 'x', 'y' => 'y'}
    response.should redirect_to(film_url(film))
  end

  it "edit action should render edit template" do
    film = Factory(:film)
    Film.stubs(:find).with(film.id).returns(film)
    get :edit, :id => film.id
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    film = Factory(:film)
    Film.expects(:find).with(film.id).returns(film)
    film.expects(:update_attributes).with('x' => 'x', 'y' => 'y').returns(false)
    put :update, :id => film.id, :film => {'x' => 'x', 'y' => 'y'}
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    film = Factory(:film)
    Film.expects(:find).with(film.id).returns(film)
    film.expects(:update_attributes).with('x' => 'x', 'y' => 'y').returns(true)
    put :update, :id => film.id, :film => {'x' => 'x', 'y' => 'y'}
    response.should redirect_to(film_url(assigns[:film]))
  end

  it "destroy action should destroy model and redirect to index action" do
    film = Film.create!(:name => 'a film', :url => 'http://test/url', :description => 'some description')
    lambda do
      delete :destroy, :id => film.id
      response.should redirect_to(films_url)
    end.should change(Film, :count).by(-1)
  end
end
