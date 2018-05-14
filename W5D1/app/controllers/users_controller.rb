class UsersController < ApplicationController

  def new
    @user = User.new
    render :new   #not needed, if we named correctly, views would render from a file named new.
  end


  def create
    @user = User.new(user_params)
    if @user
      login(@user)  #makes sure user logs in after creating his account, without having to manually login again
      redirect_to user_url(@user)

    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end

  def show
    @user = current_user
    render :show
  end


  private

  def user_params
    params.require(:user).permit(:email_address,:password)   #when user creates his account, he will set up password, which we convert to password digest
  end

end
