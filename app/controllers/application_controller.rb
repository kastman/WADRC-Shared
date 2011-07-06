class ApplicationController < ActionController::Base
  include Clearance::Authentication
  protect_from_forgery
  
  def default_search(klass)
    if !params[:search].blank? && !params[:search][:meta_sort].blank?
      klass.unscoped.search(params[:search])
    else
      klass.search(params[:search])
    end
  end
end
