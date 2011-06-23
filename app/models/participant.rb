class Participant < ActiveRecord::Base
  has_many :enrollments
  has_many :enrollment_visit_memberships, :through => :enrollments, :source => :enrollment_visit_memberships do
    def visits
      @visits ||= Visit.find(map(&:visit_id))
    end
  end
  
  validates_presence_of :initials, :reggieid
  
  has_one :demographic
  delegate :sex, :race_name, :dob, :handedness, :to => :demographic
  
  default_scope order(:reggieid)
  
  acts_as_reportable :except => [:created_at, :updated_at]
  
  def reggie_initials
    "%s - %s" % [reggieid, initials]
  end
  
  def self.report(participants)
    table = Ruport::Data::Table.new(:column_names => participants.first.attributes.keys)
    participants.each do |p|
      logger.debug p.relation
      table << Ruport::Data::Record.new(p.attributes)
    end
    
    table
  end
  
  def self.report_from_table
    report_table(:all, 
      :include => {:enrollments => {
        :include => {:enrollment_visit_memberships => {
          :include => {:visit => {
            :include => :appointments
          }}
        }}
      }})
  end
  
  def self.report_search(search)
    logger.debug search.to_sql
    report_table_by_sql(search.to_sql)
    # table = Ruport::Data::Table.new(:column_names => search.first.attributes.keys)
    
  end
end
