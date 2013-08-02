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

  def errors_for(object, field)
    errors = if object && object.errors && object.errors.messages[field]
      object.errors.messages[field].map do |message|
        "<div class='form_error'>#{message}</div>"
      end.join
    end
    raw errors
  end

  def show_flash
    raw "<div class='flash_notice'>#{flash[:notice]}</div>" if flash[:notice]
  end
end
