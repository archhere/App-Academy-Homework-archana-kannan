class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create

    #this is when user already has an account and he is trying to loginto a new session. Since he set up his account, his credentials are available in params
    @user = User.find_by_credentials(params[:user][:email_address],params[:user][:password])
    if @user
      login(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = ["This email address and password doesnot match our records. Please try again."]  #not clear why we need this in an array. Will test later
      redirect_to new_session_url
    end
  end


  def destroy
    #no need to pass on argument, as we have his details from login
    logout
    redirect_to new_session_url
  end

end
