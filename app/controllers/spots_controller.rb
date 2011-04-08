class SpotsController < ApplicationController 
  
  before_filter :authenticate, :only => :show 
  	
  def index
      @spots = Spot.all
  end

  def show

      if params[:id] != nil then
         busyspot = Spot.find(params[:id]).sessionid
         if busyspot == nil then
              prespot = Spot.find_by_sessionid(current_user.id)
              if prespot != nil then
                  prespot.sessionid = nil
                  prespot.save
              end
              spot = Spot.find(params[:id])
              spot.sessionid = current_user.id
              spot.save     
          
          end
      end
       redirect_to(root_path)
  end

   

end
   
