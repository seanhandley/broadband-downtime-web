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
    respond_with(((0.upto(5).to_a * range.count).sample(range.count-1) << 20).shuffle)
  end
  
  def months
    respond_with(range)
  end
  
  private
  
  def range
    (1.month.ago.to_date..Date.today).map{ |date| date.strftime("%b %d") }
  end
  
end