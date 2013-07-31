module WorkersHelper
  def logo_for(review)
    formats_regexp = /\.#{PhotoUploader.new.extension_white_list.join('$|\.')}$/
    alt = review.logo.url.split('/').last.sub(formats_regexp, '')
    image_tag review.logo.thumb.url, alt: alt
  end
end