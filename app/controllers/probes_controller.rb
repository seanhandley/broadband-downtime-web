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
    respond_with(5.upto(20.0).to_a.sample(12).shuffle)
  end
  
  def months
    respond_with(Date::MONTHNAMES.compact)
  end
  
end