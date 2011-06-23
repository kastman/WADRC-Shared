class SeriesLogItem < ActiveRecord::Base
  belongs_to :series
  belongs_to :functional_scenario
  
  validates_presence_of :series
  
  delegate :appointment_date, :order, :appointment, :to => :series
  delegate :description, :to => :functional_scenario
  
  scope :functionals_by_set, includes(:series).joins(:functional_scenario).where(:functional_scenario => {:functional_set_id => 3}).order(:series => :order)
  scope :functionals_by_description, joins(:functional_scenario).where(:functional_scenario => {:description => /Functional/i})
  
  def related_series
    @related_series ||= self.series.appointment.series
  end
  
  def related_pulse_series
    @related_pulse_series ||= self.series.appointment.series.pulse_series_by_log_items
  end
  
  def move_up_one_position
    new_series = related_series.select {|series| series.order == (1 + order)}.first
    self.series = new_series
  end
  
  def move_up_one_position!
    move_up_one_position
    save
  end
  
  def move_up_all_above
    higher_series_log_items = series.appointment.series_log_items.where(:series => {:order.gte => order}).order("`order` DESC") # related_series.select{|series| series.order > order}
    puts higher_series_log_items.to_sql
    higher_series_log_items.each do |higher|
      pp higher
      higher.move_up_one_position!
    end
  end
  
  private
  
  def preferred_series_id; end
  
end
