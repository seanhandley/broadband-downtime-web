class Plot
  
  def self.points_for(start_date)
    points = []
    Probe.where('probed_at > ?', start_date).group_by {|p| p.probed_at.to_date.to_s }.each do |date, probes|
      successful_probes = probes.select {|p| p.successful }.count
      points << (successful_probes / (probes.count * 1.0)) * 100.0
    end
    points
  end
  
end