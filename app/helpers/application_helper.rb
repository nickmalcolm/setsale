module ApplicationHelper
  
  def pretty_date date
    date.nil? ? "No date set" : date.strftime("%l:%M%p %e %b")
  end
end
