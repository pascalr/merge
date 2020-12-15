module AppsHelper
  #def app_folder()
  #  Rails.root.join("public").join('apps').join(params[:app_name] || params[:name])
  #end
  #def app_file(filename)
  #  app_folder.join(filename)
  #end
  def image?(path)
    return false if File.directory?(path)
    return true if File.binread(path, 3) == 'GIF'
    return true if File.binread(path, 3, 1) == 'PNG'
    return true if File.binread(path, 4, 6) == 'JFIF'
    ext = Pathname.new(path).extname
    return true if ext == '.svg'
    false
  end
  #def render_partial(name, options={})
  #  v = {file: app_file("_#{name}")}
  #  logger.info v.merge(options)
  #  render v.merge(options)
  #end
end
