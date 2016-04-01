class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if @user
      login!(@user)
      redirect_to bands_url(@user)
    else
      @user = User.new(email: params[:user][:email])
      @user.errors[:base] << "Invalid credentials"
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end
end
