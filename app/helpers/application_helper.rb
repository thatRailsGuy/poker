module ApplicationHelper
  # Insert card images in markdown
  def insert_cards(full_document)
    full_document.gsub(/\[card:(.*?)\]/) do
      "#{image_tag("SVG-cards-1.3/"+$1.tr(" ","_")+".svg", height: '64')}"
    end
  end
  # Insert link to a game referenced by name
  def link_to_game(full_document)
    full_document.gsub(/\[game:(.*?)\]/) do
      link_to $1, Game.where(name: $1).first
    end
  end
  
  def insert_custom_replacements(full_document)
    insert_cards(link_to_game(full_document))
  end
  def markdown(content)
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, hard_wrap: true, filter_html: true, no_intraemphasis: true, fenced_code: true, gh_blockcode: true)
    @markdown.render(insert_custom_replacements(content)).html_safe
  end
end
