module ApplicationHelper
  # def markdown(text)
  #   options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
  #   syntax_highlighter(Redcarpet.new(text, *options).to_html).html_safe
  # end
  
  def markdown(content)
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, hard_wrap: true, filter_html: true, no_intraemphasis: true, fenced_code: true, gh_blockcode: true)
    syntax_highlighter(@markdown.render(content)).html_safe
  end

  def syntax_highlighter(html)
    doc = Nokogiri::HTML(html)
    doc.search("//pre[@lang]").each do |pre|
      pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
    end
    doc.to_s
  end
end
