module ApplicationHelper
  
  def display_agreement(agreement)
    ("<span class='%s'>%.3f</span>" % [agreement_class(agreement), agreement]).html_safe
  end
  
  def agreement_class(agreement)
    case agreement
    when 0..0.5
      "good_agreement"
    when 0.5..0.8
      "passable_agreement"
    when 0.8..1
      "bad_agreement"
    end
  end
end
