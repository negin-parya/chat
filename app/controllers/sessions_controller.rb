class SessionsController < ApplicationController
  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now[:alert] = "Invalid login/password combination"
      render :action => 'new'
    end
  end

  def destroy
    if current_user != nil then
        prespot = Spot.find_by_sessionid(current_user.id)
        if prespot != nil then
            prespot.sessionid = nil
            prespot.save
        end
     end
     reset_session
     redirect_to(root_path)
  end
end