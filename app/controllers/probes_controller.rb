class ProbesController < ApplicationController
  
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
  
end