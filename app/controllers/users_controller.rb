class UsersController < ApplicationController
  def index
    @user = current_user
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
    @user = User.find(session[:user_id])
  end

  def show
    @user = User.find(params[:id])
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
    @user = User.find(session[:user_id])
    # if @user.save
    @user.update_attributes(params[:user])
    if request.xhr?
      render 'show', layout: false
    else
      redirect_to user_path(@user)
    end
    # else
    #   render 'new'
  end
  # end

  def destroy
    @user = User.find(session[:user_id])
    @user.destroy
  end

  def status_update
    @item = current_user.items.new(content: params[:status],
      item_type: "status")
    @item.wall_owner_id = params[:id]
    if @item.save
      redirect_to user_path(params[:id])
    else
      render 'show'
    end
  end

  def add_comment
    @comment = current_user.items.create(content: params[:comment],
      item_type: "comment")
    @comment.wall_owner_id = params[:wall_owner_id]
    @comment.relation_id = params[:parent_id]
    if @comment.save
      redirect_to user_path(params[:wall_owner_id])
    else
      params[:id] = params[:wall_owner_id]
      render 'show'
    end
  end

  def like_item
    @item = Item.find(params[:item_id])
    current_user.toggle_like!(@item)
    if @item.item_type == "comment"
      redirect_person = @item.parent.wall_owner
    elsif @item.item_type == "status"
      redirect_person = @item.wall_owner
    end
    redirect_to user_path(redirect_person)
  end

end
