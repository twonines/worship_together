class ServicesController < ApplicationController
  def index
	 # order_param = (params[:order] || :Day).to_sym
	  #ordering = case order_param
		 #  when :Day
		  #    :day_of_week
		  #     
		   #when :Time
		  #     :start_time
		  # end
	  #@church = Service.order(ordering)
	  
	  @churches = Church.find(params[:church_id])
	  #@services = @churches.services
	  
	  @services = @churches.Service.all
  end

end

