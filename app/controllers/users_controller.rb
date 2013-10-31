class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def login
    if @user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @error = "We were unable to find that email and password combination."
      render 'welcome/index'
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to :root
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end
  def request_friend
    @pending_friend = User.find(params[:id])
    @pending_friend.pending_friends << User.find(session[:user_id])    
    redirect_to users_path
  end

  def approve_friend
    @user = User.find(session[:user_id])
    @user.accept_friend(params[:id])
    redirect_to user_path(@user)
  end

  def update
    end

  end
  def destroy
  end
end
