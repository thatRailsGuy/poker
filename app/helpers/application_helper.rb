module ApplicationHelper
  
  def sortable(column, title=nil)
    title ||= column.titleize
    css_class = column == sort_column ? "active #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    if css_class == "active asc"
      link_to raw(title+" <span class=\"glyphicon glyphicon-chevron-up\"></span>"), {:sort => column, :direction => direction, :search => params["search"]}, {:class => css_class}
    elsif css_class == "active desc"
      link_to raw(title+" <span class=\"glyphicon glyphicon-chevron-down\"></span>"), {:sort => column, :direction => direction, :search => params["search"]}, {:class => css_class}
    else
      link_to title, {:sort => column, :direction => direction, :search => params["search"]}, {:class => css_class}
    end
  end
  
  def change_words_to_numbers(full_document)
    full_document.gsub(/(two)/,'2').gsub(/(three)/,'3').gsub(/(four)/,'4').gsub(/(five)/,'5').gsub(/(six)/,'6').gsub(/(seven)/,'7').gsub(/(eight)/,'8').gsub(/(nine)/,'9').gsub(/(ten)/,'10')
  end
  # Insert card images in markdown
  def insert_cards(full_document)
    full_document.gsub(/\[card:(.*?)\]/) do
      "#{image_tag("SVG-cards-1.3/"+$1.tr(" ","_").downcase+".svg", height: '64')}"
    end
  end
  # Insert link to a game referenced by name
  def link_to_game(full_document)
    full_document.gsub(/\[game:(.*?)\]/) do
      link_to $1, Game.where(name: $1).first
    end
  end
  
  def insert_custom_replacements(full_document)
    insert_cards(link_to_game(change_words_to_numbers(full_document)))
  end
  def markdown(content)
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, hard_wrap: true, filter_html: true, no_intraemphasis: true, fenced_code: true, gh_blockcode: true)
    @markdown.render(insert_custom_replacements(content)).html_safe
  end
end
