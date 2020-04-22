class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def my_friends
    @friends = current_user.friends
  end

  def search
        if params[:friend].present?
            @friends = User.search(params[:friend])
            @friends = current_user.except_current_user(@friends)
            if @friends
                respond_to do |format|
                    format.js{ render partial: 'users/friend_result'}
                end
                #render 'users/my_portfolio'
            else
                respond_to do |format|
                    flash.now[:alert] = "Can't find user"
                    #redirect_to my_portfolio_path
                    format.js { render partial: 'users/friend_result' }
                end
            end
        else
            respond_to do |format|
                flash.now[:alert] = "Please enter a name or email to search"
                #redirect_to my_portfolio_path
                format.js { render partial: 'users/friend_result' }
            end
        end
    end

end
