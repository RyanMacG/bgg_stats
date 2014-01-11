module ApplicationHelper
  def page_title
    base_title = "BGG Stats"
    if @page_title
      "#{base_title} | #{@page_title}"
    else
      base_title
    end
  end
end
