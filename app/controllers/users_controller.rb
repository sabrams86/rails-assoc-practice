class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = set_user
  end

  def new
    @user = User.new
  end

  def edit
    @user = set_user
  end

  def create
    @user = User.new(user_params)
    @user.date_joined = DateTime.now
    respond_to do |format|
      if @user.save
        format.html {redirect_to @user, notice: "Info Successfully Saved"}
        format.json {render :show, status: :created, location: @user}
      else
        format.html {render :new}
        format.json {render :json, @item.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(item_params)
        format.html {redirect_to @user, notice: "Info Successfully Saved"}
        format.json {render :show, status: :ok, location: @user}
      else
        format.html {render :new}
        format.json {render :json, @item.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html {redirect_to users_path, notice: "User Account Deleted"}
      format.json {head :no_content}
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :name, :password, :email, :date_joined, :city, :state, :zip)
  end

end
