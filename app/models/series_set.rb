class SeriesSet < ActiveRecord::Base
  validates :appointment, :presence => true
  validates :series_set_category, :presence => true
    
  # acts_as_list :position_in_category
  
  has_many :series
  has_many :series_metainfos, :through => :series
  has_many :series_log_items, :through => :series

  has_many :scan_tasks, :through => :series
  has_many :pulse_sequences, :through => :series
  
  belongs_to :appointment
  belongs_to :series_set_category
  
  delegate :setname, :to => :series_set_category
  
  scope :pfile, where(:series_set_category => SeriesSetCategory::PFILE)
  scope :sequence, where(:series_set_category => SeriesSetCategory::SEQUENCE)
  scope :pre, where(:series_set_category => SeriesSetCategory::PRE)
  scope :post, where(:series_set_category => SeriesSetCategory::POST)
  
  # Take each functional task and set its series to the correct pulse sequence.
  def align_tasks
    # task_log_items = scan_tasks
    # task_metainfos = series_metainfos.select {|m| m.series_description =~ /Task|fMRI/i}

    series_with_metainfos = series.with_functional_metainfo.order(:position)

    
    if scan_tasks.size == series_with_metainfos.size
      scan_tasks.zip(series_with_metainfos).each do |item, series|
        # if defined?(PP)
        #   pp "Item: ", item
        #   pp "Series: ", series
        # end
        item.update_attributes(:series => series) unless item.series == series
      end
    else
      self.errors.add(:base, "Can't align tasks of different sizes: Items (#{scan_tasks.size}), Metainfos (#{series_with_metainfos.size})")
      return nil
    end
  end
  
  
end
