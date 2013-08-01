# Encoding: utf-8
module ApplicationHelper
  def errors_for(object, field)
    result = ' '
    if object
      object.errors[field].each do |message|
        result += "<div class='error_message'>#{message}</div>\n"
      end
    end
    raw result
  end

  def cp(path)
    "active" if current_page?(path)
  end

  def seo_meta_tags
    if @page && @page.seo
      "<meta name='description' content='#{@page.seo.description}' />"+
      "<meta name='keywords' content='#{@page.seo.keywords}' />"+
      "<title>#{@page.seo.title}</title>"
    end
  end
end
