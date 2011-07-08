require 'pp'

namespace :metainfo do
  
  desc "Run maintainance tasks after a fresh dump."
  task :bootstrap => [:assign_set, :assign, :align_tasks, :assign, :remove_childless_series]

  desc "Assign a series_set to series (pfile, sequence, etc)"
  task(:assign_set => :environment) do
    successes = []
    errors = []
    Series.find_each do |series|
    # Series.limit(10).each do |series|
      # pp series
      result = series.associate_with_series_set
      if result
        successes << series
        print '.'
      elsif result == nil
        print '*'
      else
        errors << series
        print 'x'
      end
      STDOUT.flush
    end
    
    errors.each {|series| pp [series, series.errors]}
    pp successes
    puts "#{errors.size} errors, #{successes.size} successes"
    
  end    

  desc "Assign a series to metainfo"
  task(:assign => :environment) do
    successes = []
    errors = []
    warnings = []
    orphan_rmrs = Set.new
    SeriesMetainfo.find_each do |info|
    # SeriesMetainfo.limit(500).offset(2000).each do |info|
      result = info.associate_with_related_series
      if result
        if info.errors.empty?
          successes << info.id
          print '.'
        else
          orphan_rmrs << info.rmr
          warnings << info
          print 'w'
        end
      elsif result == nil
        print '*'
      else
        errors << info
        print 'x'
      end
      STDOUT.flush
    end
    
    errors.each {|model| pp [model.id, model.errors]}
    warnings.each {|model| pp [model.id, model.errors]}
    puts "#{errors.size} errors"
    puts "#{warnings.size} warnings"
    puts "#{successes.size} metainfos successfully saved."
    pp orphan_rmrs
    
  end
  
  desc "Align tasks within each appointment."
  task(:align_tasks => :environment) do 
    errors = []
    successes = []
    
    # Appointment.all(:limit => 50).each do |appointment|
    Appointment.find_each do |appointment|
      result = appointment.align_tasks
      
      if result
        successes << appointment
        print '.'
      elsif result == nil
        errors << appointment
        print '*'
      else
        errors << appointment
        print 'x'
      end
      STDOUT.flush
      
    end

    errors.each {|appointment| pp [appointment, appointment.errors]}
    puts "#{errors.size} errors"
      
        
    # # Appointment.all[1000..1200].each do |appointment|    
    # # Appointment.where(:id => 1327).each do |appointment|
    #   appt_date = appointment.appointment_date
    #   rmr = appointment.mri_scan.present? ? appointment.mri_scan.study_rmr : 'no mri details'
    #   puts "%s \t %s\n-----" % [appt_date, rmr]
    #   
    #   by_set = appointment.series_log_items.functionals_by_set
    #   by_description = appointment.series_log_items.functionals_by_description
    #   
    #   puts "By Set: #{by_set.count}\tBy Description: #{by_description.count}"
    #   next unless by_set.count == by_description.count
    #   pp by_set.collect(&:description)
    #   pp by_description.collect(&:description)
    #   
    #   by_set_series = by_set.collect(&:series)
    #   by_description_series = by_description.collect(&:series)
    # 
    #   by_set_series.zip(by_description_series).each do |in_scan_series, pulse_series|
    #     Series.merge(pulse_series, in_scan_series)
    #   end
    #   
    #   # by_set.zip(by_description).each do |in_scan, pulse|
    #   #   pulse.functional_scenario = in_scan.functional_scenario
    #   #   pulse.comment = in_scan.comment
    #   #   pulse.has_concerns = in_scan.has_concerns
    #   #   pulse.save
    #   # end
    #   # by_description.map do |in_scan| 
    #   #   # Assign the metainfo to the first series to clear it.
    #   #   if in_scan.series.series_metainfo.present?
    #   #     meta = in_scan.series.series_metainfo
    #   #     meta.series = Series.first
    #   #     meta.save
    #   #   end
    #   # 
    #   #   pp in_scan.series.series_log_item
    #   #   
    #   #   in_scan.destroy
    #   #   in_scan.series.destroy
    #   # end
    #   puts
  end
  
  desc "Remove childless series"
  task(:remove_childless_series => :environment) do
    pp Series.without_related_info.destroy_all
  end
  
  # desc "Zip Functionals"
  # task (:zip_funcs => :environment) do
  #   disputed = []
  #   pulse_sequence_set = FunctionalSet.find_by_setname('Pulse Sequence')
  #   Appointment.find_each(:start => 1000) do |appointment|
  #     unless appointment.mri_scan.blank?
  #       puts rmr_number = appointment.mri_scan.study_rmr 
  #       
  #       # metainfos
  #       # puts metainfos = appointment.series_metainfos.has_pfile.to_sql
  #       metainfos = SeriesMetainfo.functionals.where(:rmr => appointment.mri_scan.study_rmr).joins(:series).order(:series => :position)
  #       # pp metainfos.count
  #       # pp metainfos.collect(&:series_description)
  #     
  #       # log items
  #       log_items = appointment.series_log_items.functionals
  #       # pp log_items.count
  #       # pp log_items.collect(&:description)
  # 
  #       if metainfos.count != log_items.count
  #         # disputed << {:appointment => appointment, :metainfos => metainfos, :log_items => log_items} 
  #         puts "Metainfos: #{metainfos.count}; Logs: #{log_items.count}"
  #       else
  #         # Move the Functional Log Item to belong to the Pulse-Sequence Series,
  #         # then delete the In-Scan Task Series
  #         metainfos.zip(log_items).each do |meta, log|
  #           # Skip Series that Are Pfiles - they should be separate.
  #           next if meta.pfile?
  #           puts position = meta.dicom_taghash['0020,0011'][:value]
  #           
  #           puts pulse_series = appointment.series.where(:position => position).first
  #           
  #           # pulse_series.series_metainfo = meta
  #           pulse_series.series_log_item = log
  #           
  #           # original_task_series = log.series.dup
  # 
  #           # if pulse_seres.save
  #           #   original_task_series.destroy
  #           # end
  # 
  #           # meta.series = log.series
  #           # meta.save if meta.changed?
  #         end
  #       end
  #       puts "-----"
  #     end
  #   end
  #   # disputed.collect {|a,m,l| pp a }
  # end
  
  desc("Match Visits to MRI Scans")
  task(:match_mri => :environment) do
    successes = []
    errors = []
    warnings = []
    
    # VisitDatatools.limit(500).each do |old_visit|
    VisitQinling.find_each do |old_visit|
      result = old_visit.matching_mri_scan
      if result
        if old_visit.errors.empty?
          successes << old_visit.rmr
          print '.'
        else
          warnings << old_visit
          print 'w'
        end
      elsif result == nil
        unless old_visit.errors.empty?
          warnings << old_visit
        end
        print '*'
      else
        errors << old_visit
        print 'x'
      end
      STDOUT.flush
    end
    
    puts
    errors.each {|model| pp [model.id, model.errors]}
    warnings.each {|model| pp [model.id, model.errors]}
    pp successes
    puts "#{errors.size} errors"
    puts "#{warnings.size} warnings"
    puts "#{successes.size} successfully matched."
  end

end