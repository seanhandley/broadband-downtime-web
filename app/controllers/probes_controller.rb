class ProbesController < ApplicationController
  
  respond_to :json
  
  def create
    @probe = Probe.new(params[:probe])
    @probe.from_ip = request.remote_ip
    respond_to do |wants|
      if @probe.save
        wants.json { render :json => @probe.to_json, :status => :created } 
      else
        wants.json { render :json => @probe.errors.to_json, :status => :unprocessable_entity }
      end
    end
  end
  
  def index
    respond_with(Probe.all)
  end
  
  def test
    respond_with([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6].shuffle)
  end
  
  def months
    respond_with(['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'])
  end
  
end