module ApplicationHelper
  def markdown(content)
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, hard_wrap: true, filter_html: true, no_intraemphasis: true, fenced_code: true, gh_blockcode: true)
    @markdown.render(content).html_safe
  end
end
