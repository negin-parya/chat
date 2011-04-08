class UsersController < ApplicationController
  
before_filter :authenticate, :except => [:new, :create]
 # GET /users

  # GET /users.xml

  def index

    if current_user!=nil
       @users = current_user.id


       respond_to do |format|

          format.html # index.html.erb

          format.xml  { render :xml => @users }

       end

    else  redirect_to("/spots")
    end
 end




  # GET /users/1
  # GET /users/1.xml

  def show

    @user = User.find(params[:id])


    respond_to do |format|

      format.html # show.html.erb

      format.xml  { render :xml => @user }

    end

  end

 

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to users_path, :notice => 'User successfully added.'
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    respond_to do |format|

      if @user.update_attributes(params[:user])

        format.html { redirect_to(root_path, :notice => 'Your profile was successfully updated.') }

        format.xml  { head :ok }

      else

        format.html { render :action => "edit" }

        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }

      end
  end
end
end