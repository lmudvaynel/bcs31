module ReviewHelper

  # Выбираем всевозможные форматы, которые могут быть у логотипа
  # и вырезаем их, вместе с путём, оставляя лишь имя файла без расширения
  # в качестве атрибута alt для тега с изображением логотипа
  # (безумие бесподобно!)
  def logo_for(review)
    formats_regexp = /\.#{ReviewLogoUploader.new.extension_white_list.join('$|\.')}$/
    alt = review.logo.url.split('/').last.sub(formats_regexp, '')
    image_tag review.logo.thumb.url, alt: alt
  end

end
