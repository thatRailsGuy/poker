module ApplicationHelper
  def insert_cards(full_document)
    full_document.gsub(/\[card:(.*)\]/) do
      "#{image_tag("SVG-cards-1.3/"+$1.tr(" ","_")+".svg", height: '64')}"
    end
  end
  def markdown(content)
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, hard_wrap: true, filter_html: true, no_intraemphasis: true, fenced_code: true, gh_blockcode: true)
    @markdown.render(insert_cards(content)).html_safe
  end
end
