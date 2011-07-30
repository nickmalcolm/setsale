module ApplicationHelper
  
  def pretty_date date
    date.nil? ? "No date set" : date.strftime("%l:%M%p %e %b")
  end
  
  def pluralize_with_tags(integer, word)
    ("<span class='plural_count'>#{integer}</span> "+
    "<span class='plural_word'>#{word}</span>"+
    "<span class='plural_s'>#{'s' if integer != 1}</span>").html_safe
  end
  
end
