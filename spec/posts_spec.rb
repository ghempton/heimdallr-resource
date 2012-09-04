require 'spec_helper'

describe PostsController, :type => :controller do
  before(:all) do
    @admin   = User.create!   :admin => true
    Post.create! :title => 'post 1'
    Post.create! :title => 'post 2'
  end

  after(:all) do
    Post.delete_all
  end

  it "accepts load_and_authorize_resource" do
    User.mock @admin
    get :index

    assigns(:posts).count.should == 2
  end
end