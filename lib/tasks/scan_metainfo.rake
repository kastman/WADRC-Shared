require 'pp'

namespace :metainfo do
  
  desc "Run maintainance tasks after a fresh dump."
  task :bootstrap => [:match_mri, :match_enrollments, :assign, :align_tasks, :assign, :remove_childless_series]

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
    
    # SeriesSet.sequence.limit(50).each do |set|
    SeriesSet.sequence.find_each do |set|
      result = set.align_tasks
      
      if result
        successes << set
        print '.'
      elsif result == nil
        errors << set
        print '*'
      else
        errors << set
        print 'x'
      end
      STDOUT.flush
      
    end

    puts 
    errors.each {|set| pp [set, set.errors]}
    puts "#{errors.size} errors"
  end
  
  desc "Remove childless series"
  task(:remove_childless_series => :environment) do
    pp Series.without_related_info.destroy_all
  end
  
  
  desc("Match Visits to MRI Scans")
  task(:match_mri => :environment) do
    successes = []
    errors = []
    warnings = []
    
    # VisitQinling.limit(500).offset(500).each do |old_visit|
    VisitQinling.find_each do |old_visit|
      result = old_visit.matching_mri_scan
      if result
        if old_visit.errors.empty?
          result.update_attributes(old_visit.scan_attributes)
          successes << {:msg => old_visit.spaceship_message(result), :distance => old_visit.lev_distance(result) }
          print '.'
        else
          warnings << old_visit
          print 'w'
        end
      elsif result == nil
        unless old_visit.errors.empty?
          warnings << old_visit
        else
          errors << old_visit
        end
        print '*'
      else
        errors << old_visit
        print 'x'
      end
      STDOUT.flush
    end
    
    puts
    puts "Errors:"
    errors.each {|model| pp [model.id, model.errors]}
    puts "Warnings:"
    warnings.each {|model| pp [model.id, model.errors]}
    puts "Successes:"
    pp successes.sort {|first,second| first[:distance] <=> second[:distance]}
    puts "#{errors.size} errors"
    puts "#{warnings.size} warnings"
    puts "#{successes.size} successfully matched."
  end

  desc("Match Visits to Enrollments")
  task(:match_enrollments => :environment) do
    successes = []
    errors = []
    warnings = []
    
    # VisitQinling.limit(200).offset(500).each do |old_visit|
    VisitQinling.find_each do |old_visit|
      mri = old_visit.matching_mri_scan
      next unless mri
      visit = mri.appointment.visit
      
      result = old_visit.infer_enrollments
      if result.present?
        if old_visit.errors.empty?
          visit.enrollments = result
          successes << result
          print '.'
        else
          warnings << old_visit
          print 'w'
        end
      elsif result == nil
        unless old_visit.errors.empty?
          warnings << old_visit
        else
          errors << old_visit
        end
        print '*'
      else
        errors << old_visit
        print 'x'
      end
      STDOUT.flush
    end
    
    puts
    puts "Errors:"
    errors.each {|model| pp [model.id, model.errors]}
    puts "Warnings:"
    warnings.each {|model| pp [model.id, model.errors]}
    puts "Successes:"
    pp successes
    puts "#{errors.size} errors"
    puts "#{warnings.size} warnings"
    puts "#{successes.size} successfully matched."
  end
  

end