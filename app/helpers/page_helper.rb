module PageHelper

  def menu_item_state(page)
    slug = params[:slug]
    if page.slug == slug || page.children.find{|p| p.slug == slug }
      'current'
    end
  end
  
  def title(page)
    html_title = ''
    if page.children.empty?
       page = page.parent
    end
    html_title = (link_to page.name, slug_path(page))
    while page.parent
      page = page.parent
      html_title = (link_to page.name, slug_path(page)) + ' > ' + html_title
    end
    raw <<-HTML
          #{html_title}
    HTML
  end
end
