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
  
  def dicom_position
    dicom_taghash['0020,0011'][:value] || ''
  end
  
  def infer_position
    position_from_taghash || position_from_path || position_from_rmr_index || nil
  end
  
  def associate_with_related_series
    position = infer_position
    conditions = {:appointment => {:mri_scans => {:study_rmr => rmr }}}
    
    conditions[:order] = position unless position.blank?
    conditions[:pfile] = pfile? ? pfile_digits : nil
    
    series = Series.joins(:appointment => :mri_scan).where(conditions).first
    
    pp series unless series.blank? if defined?(PP)
      
    unless series.blank?
      self.series = series
      if self.series.changed?
        unless save
          return [self, self.errors]
        end
      end
    else
      appointment = Appointment.joins(:mri_scan).where(:mri_scans => {:study_rmr => rmr}).first
      if appointment.blank?
        puts "Can't find appointment with mri visit with rmr: #{info.rmr}"
      else
        # pp appointment
        # pp info
        new_series = appointment.series.build(:order => position, :series_metainfo => self)
        unless new_series.save
          return [self, new_series.errors]
        end
      end
    end
  end
  
  
  private 
  
  def position_from_taghash
    dicom_position if dicom_taghash.present?
  end
  
  def position_from_path
    match = /^S?(\d*)/.match(File.basename(path))
    match[1] if match
  end
  
  def position_from_rmr_index
    metainfos = SeriesMetainfo.where(:rmr => rmr, :scanned_file.not_eq => PFILE_REGEX_NON_MATCHING)
    metainfos.include?(self) ?  metainfos.index(self) + 1 : nil
  end
  
  
  scope :func_descriptions, where(:series_description => /fMRI|Run|Rest|Task/i)
  scope :has_pfile, where(:scanned_file => PFILE_REGEX_NON_MATCHING)
  # Can't find a nice to combine scopes with OR right now without explicitly doing it. This OR syntax is supported by meta_where.
  scope :functionals, where({:series_description => /fMRI|Run|Rest|Task/i} | {:scanned_file => /^P.+\.7$/})
end
