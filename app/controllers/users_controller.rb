class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    unless current_user == @user || (current_user && current_user.is_admin)
      flash[:alert] = I18n.t('not_authorized')
      redirect_to root_url
    end
  end
end
