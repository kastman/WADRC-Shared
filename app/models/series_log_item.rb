class SeriesLogItem < ActiveRecord::Base
  # SeriesSet Constants are defined in SeriesSet.rb
  belongs_to :series
  belongs_to :functional_scenario
  
  validates_presence_of :series
  
  delegate :appointment_date, :order, :appointment, :to => :series
  delegate :description, :setname, :to => :functional_scenario
  
  scope :functionals_by_set, includes(:series).joins(:functional_scenario).where(:functional_scenario => {:functional_set_id => 3}).order(:series => :order)
  scope :functionals_by_description, joins(:functional_scenario).where(:functional_scenario => {:description => /Functional/i})
  # scope :functional_or_pulse_by_set_except_pfiles, joins(:functional_scenario, :series).where({:series => {:pfile => nil}}, {:functional_scenario => {:functional_set_id => [3,8]}})
  scope :functional_or_pulse_by_set, joins(:functional_scenario).where(:functional_scenario => {:functional_set_id => [3,8]})
  scope :except_pfiles, joins(:series).where(:series => {:pfile => nil})
  
  def related_series
    @related_series ||= self.series.appointment.series
  end
  
  def related_pulse_series
    @related_pulse_series ||= self.series.appointment.series.with_pulse_sequences
  end
  
  def move_up_one_position
    # new_series = related_pulse_series.select {|series| series.order == (1 + order)}.first
    self.series = one_series_up
  end
  
  def one_series_up
    new_series = self.series.appointment.series.find_or_initialize_by_order_and_series_set_id(order + 1, SeriesSet::SEQUENCE_SET.id)
  end
  
  def one_series_down
    new_series = self.series.appointment.series.find_or_initialize_by_order_and_series_set_id(order - 1, SeriesSet::SEQUENCE_SET.id)
  end
  
  def move_up_one_position!
    move_up_one_position
    save
  end
  
  def move_down_one_position!
    self.series = one_series_down
    save
  end

  def move_down_all_above
    higher_series_log_items = appointment.series_log_items.functional_or_pulse_by_set.except_pfiles.where(:series => {:order.gte => order}).order("`series`.`order` ASC") # related_series.select{|series| series.order > order}
    logger.debug higher_series_log_items.to_sql
    higher_series_log_items.each do |higher|
      logger.debug { higher }
      higher.move_down_one_position!
    end
  end

  
  def move_up_all_above
    higher_series_log_items = appointment.series_log_items.functional_or_pulse_by_set.except_pfiles.where(:series => {:order.gte => order}).order("`series`.`order` ASC") # related_series.select{|series| series.order > order}
    logger.debug higher_series_log_items.to_sql
    higher_series_log_items.each do |higher|
      logger.debug { higher }
      higher.move_up_one_position!
    end
  end
  
  private
  
  def preferred_series_id; end
  
end
