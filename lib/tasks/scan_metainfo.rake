require 'pp'

namespace :metainfo do
  
  desc "Run maintainance tasks after a fresh dump."
  task :bootstrap => [:assign_set, :assign, :align_tasks, :assign, :remove_childless_series]
    

  desc "Assign a series to metainfo"
  task(:assign => :environment) do
    errors = []
    SeriesMetainfo.find_each do |info|
      results = info.associate_with_related_series
      errors << results unless results.blank?
    end
    
    pp errors
    puts errors.size, " errors"
  end
  
  desc "Remove childless series"
  task(:remove_childless_series => :environment) do
    pp Series.without_related_info.destroy_all
  end
  
  desc "Assign a series_set to series (pfile, sequence, etc)"
  task(:assign_set => :environment) do
    errors = []
    Series.find_each do |series|
      # pp series
      result = series.associate_with_series_set
      if result == true
        mark = '.'
      else
        errors << result
        mark = 'x'
      end
      print mark; STDOUT.flush
    end
    
    pp errors
    puts errors.size, " errors"
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
  
  desc "Align tasks within each appointment."
  task(:align_tasks => :environment) do 
    Appointment.find_each do |appointment|
      a.align_tasks
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
  end
  

end