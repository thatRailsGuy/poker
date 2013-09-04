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
    full_document.gsub(/(\[card:two)/,'[card:2').gsub(/(\[card:three)/,'[card:3').gsub(/(\[card:four)/,'[card:4').gsub(/(\[card:five)/,'[card:5').gsub(/(\[card:six)/,'[card:6').gsub(/(\[card:seven)/,'[card:7').gsub(/(\[card:eight)/,'[card:8').gsub(/(\[card:nine)/,'[card:9').gsub(/(\[card:ten)/,'[card:10')
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
