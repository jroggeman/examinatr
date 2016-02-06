# require 'redcarpet'

module ExamsHelper
  def markdown_renderer
    @markdown_render ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end

  def parse(text)
    markdown_renderer.render(text).html_safe
  end
end
