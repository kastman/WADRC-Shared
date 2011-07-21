class SeriesMetainfo < ActiveRecord::Base
  PFILE_REGEX_MATCHING = /^P(\d{5}).7$/
  PFILE_REGEX_NON_MATCHING = /^P[0-9]{5}\.7$/
  belongs_to :series
  
  validates_presence_of :series, :rmr, :series_description, :path, :timestamp
  serialize :dicom_taghash
  
  def pfile?
    scanned_file =~ PFILE_REGEX_MATCHING
  end
  
  # Get the first regex capture of the pfile.
  def pfile_digits
    PFILE_REGEX_MATCHING.match(scanned_file)[1]
  end
    
  def associate_with_related_series
    position = infer_position
    position = 0 if position.blank?
    
    conditions = {:series_set => {:appointment => {:mri_scan => {:study_rmr => rmr} }}}
    
    conditions[:position] = position unless position == 0
    conditions[:pfile] = pfile? ? pfile_digits : nil
    
    all_matched_series = Series.joins(:series_set => {:appointment => :mri_scan}).where(conditions)
    unless pfile?
      all_matched_series = all_matched_series.with_sequence_set
    end
    # pp all_matched_series.to_sql
    # pp all_matched_series
    matched_series = all_matched_series.select {|series| series.series_log_items.present? }.first || all_matched_series.first

    # pp matched_series unless matched_series.blank? if defined?(PP)
      
    unless matched_series.blank?
      unless self.series == matched_series
        # puts "updating #{id}"
        update_attributes(:series => matched_series)
      else
        # puts "#{id} not changed."
        return nil
      end
    else
      appointment = Appointment.joins(:mri_scan).where(:mri_scans => {:study_rmr => rmr}).first
      if appointment.blank?
        # errors.add(:base, "Can't find any appointments related to mri_visit having :study_rmr => #{rmr} (there is no existing appointment for metainfo and series to belong to.)")
        errors.add(:rmr, "No related MRI Scan")
        # return nil
      else
        # Allow for series to not have position if this is a new pfile series and position is unknown.
        series_set_category = pfile? ? SeriesSetCategory::PFILE : SeriesSetCategory::SEQUENCE
        series_set = SeriesSet.find_or_create_by_appointment_id_and_series_set_category_id(appointment, series_set_category)
        series_options = {:series_set => series_set, :position => position}
        
        create_series(series_options)
        
        # if built_series = build_series(series_options)
        #   # built_series.save
        #   if built_series.valid?
        #     self.series = built_series
        #     save
        #   else
        #     errors.add(:series, "Cannot build valid series: #{built_series.errors.inspect}")
        #     return false
        #   end
        # end
        # new_series = appointment.series.build(:position => position, :series_metainfo => self, :series_set_id => 2)

      end
    end
  end
  
  
  private 
  
  def infer_position
    @position ||= position_from_taghash || position_from_path || position_from_rmr_index || 0
  end
  
  def dicom_position
    dicom_taghash['0020,0011'][:value].to_i || nil
  end
  
  def position_from_taghash
    dicom_taghash.present? ? dicom_position : nil
  end
  
  def position_from_path
    # puts File.basename(path)
    match = /^S?(\d+)/.match(File.basename(path))
    match ? match[1] : nil
  end
  
  def position_from_rmr_index
    info_relation = SeriesMetainfo.where(:rmr => rmr)
    metainfos = pfile?  ? info_relation.where(:scanned_file.eq => PFILE_REGEX_NON_MATCHING) : info_relation.where(:scanned_file.not_eq => PFILE_REGEX_NON_MATCHING)
    metainfos.include?(self) ?  metainfos.index(self) + 1 : nil    
  end
  
  
  scope :func_descriptions, where(:series_description => /fMRI|Run|Rest|Task/i)
  scope :has_pfile, where(:scanned_file => PFILE_REGEX_NON_MATCHING)
  # Can't find a nice to combine scopes with OR right now without explicitly doing it. This OR syntax is supported by meta_where.
  scope :functionals, where({:series_description => /fMRI|Run|Rest|Task/i} | {:scanned_file => /^P.+\.7$/})
end
