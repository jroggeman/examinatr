module ExamsHelper
  def parse(text)
    markdown_renderer.render(text).html_safe
  end

  private

  def markdown_renderer
    @markdown_render ||= Redcarpet::Markdown.new(
      Redcarpet::Render::HTML,
      disable_indented_code_blocks: false,
      fenced_code_blocks: true)
  end
end
