require File.dirname(__FILE__) + '/../spec_helper'

describe SearchController do
  
  it 'should do a wildcard Like search for films names with the supplied search_for params and assign the results to @films' do
    film = Factory(:film)
    Film.expects(:find).with(:all, :conditions => ['name LIKE ?', '%test%']).returns([film])
    post :create, :search_for => 'test'
    assigns(:films).should == [film]
    response.should render_template(:create)
  end
  
end