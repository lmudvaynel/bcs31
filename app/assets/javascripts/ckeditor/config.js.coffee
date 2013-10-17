CKEDITOR.editorConfig = (config) ->
  # Define changes to default configuration here. For example:
  config.language = 'ru'
  # config.uiColor = '#AADC6E';

  config.allowedContent = true

  # Filebrowser routes #
  # The location of an external file browser, that should be launched when "Browse Server" button is pressed.
  config.filebrowserBrowseUrl = "/ckeditor/attachment_files"

  # The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Flash dialog.
  config.filebrowserFlashBrowseUrl = "/ckeditor/attachment_files"

  # The location of a script that handles file uploads in the Flash dialog.
  config.filebrowserFlashUploadUrl = "/ckeditor/attachment_files"

  # The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Link tab of Image dialog.
  config.filebrowserImageBrowseLinkUrl = "/ckeditor/pictures"

  # The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Image dialog.
  config.filebrowserImageBrowseUrl = "/ckeditor/pictures"

  # The location of a script that handles file uploads in the Image dialog.
  config.filebrowserImageUploadUrl = "/ckeditor/pictures"

  # The location of a script that handles file uploads.
  config.filebrowserUploadUrl = "/ckeditor/attachment_files"

  # Rails CSRF token
  config.filebrowserParams = () ->
    metas = document.getElementsByTagName('meta')
    params = new Object()
    csrf_token = ''
    csrf_param = ''
    for i in [0..metas.length-1]
      meta = metas[i]
      switch meta.name
        when "csrf-token"
          csrf_token = meta.content
        when "csrf-param"
          csrf_param = meta.content
        else
          continue
    if csrf_param != '' && csrf_token != ''
      params[csrf_param] = csrf_token
    return params

  config.addQueryString = (url, params) ->
    queryString = []
    if !params
      return url
    else
      for i in params
        queryString.push( i + "=" + encodeURIComponent( params[ i ] ) )
    return url + ( ( url.indexOf( "?" ) != -1 ) ? "&" : "?" ) + queryString.join( "&" )

  # Integrate Rails CSRF token into file upload dialogs (link, image, attachment and flash)
  CKEDITOR.on 'dialogDefinition', ( ev ) ->
    # Take the dialog name and its definition from the event data.
    dialogName = ev.data.name
    dialogDefinition = ev.data.definition
    if CKEDITOR.tools.indexOf(['link', 'image', 'attachment', 'flash'], dialogName) > -1
      content = (dialogDefinition.getContents('Upload') || dialogDefinition.getContents('upload'))
      upload = (content == null ? null : content.get('upload'))
      if upload && upload.filebrowser && upload.filebrowser['params'] == undefined
        upload.filebrowser['params'] = config.filebrowserParams()
        upload.action = config.addQueryString(upload.action, upload.filebrowser['params'])
