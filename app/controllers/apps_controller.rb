class AppsController < ApplicationController

  def show_app
    app = /^[a-z_A-Z]+/.match(request.original_fullpath[5..-1])
    render "#{app}/index"
  end

  def show
    # This is safer than to check for the file directly 
    #filename = params[:action] || params[:app_name] || params[:name]
    #dir_name = params[:app_name] || params[:name]
    # TODO: Either index.html or folder_name/folder_name.html ...
    # Use index.html I think from now on
    name = params[:app_name] || params[:name]
    p = Rails.root.join('app').join('views')
    Dir.entries(p).each {|n|
      if File.directory?(p.join(n))
        next unless name.to_s == n.to_s
        ## Also check in the subfolders, only one level deep though
        Dir.entries(p.join(n)).each {|m|
          without_ext = Pathname(m).sub_ext('').sub_ext('')
          render inline: File.read(p.join(n).join(m)), layout: 'layouts/application' and return if name.to_s == without_ext.to_s
        }
      end
      without_ext = Pathname(n).sub_ext('').sub_ext('')
      render inline: File.read(p.join(n)), layout: 'layouts/application' and return if name.to_s == without_ext.to_s
    }
  end
  #def show
  #  name = File.basename(params[:name] || params[:app_name]) # TODO: sanitize name to avoid malicious users to read any file
  #  p = Rails.root.join('public').join('apps').join(name)
  #  #render file: File.directory?(p) ? p.join(name) : p
  #  render inline: File.read(File.directory?(p) ? p.join(name) : p)
  #end
  #def style
  #  folder = File.basename(params[:app_name]) # TODO: sanitize name to avoid malicious users to read any file
  #  filename = File.basename(params[:filename]) # TODO: sanitize name to avoid malicious users to read any file
  #  render file: Rails.root.join('app').join('views').join(folder).join(filename)
  #  #send_file Rails.root.join('public').join('apps').join(folder).join(filename)
  #end
  def delete_file
    name = File.basename(params[:filename]) # sanitize name to avoid malicious users to read any file
    if params[:folder] # FIXME: REALLY NOT SAFE
      p = Rails.root.join('views').join(params[:folder]).join(name)
    else
      p = Rails.root.join('views').join(name)
    end
    File.delete(p)
    redirect_to request.referrer
  end
  def create_column
    Rails.application.eager_load!
    @models = ApplicationRecord.descendants
    @model = @models.find {|m| m.name == params[:model_name]}
    name = params[:name] # TODO: Sanitize name
    type = params[:type] # TODO: Sanitize type
    out = `rails g migration add_#{name}_to_#{@model.table_name} #{name}:#{type} && rails db:migrate`
    redirect_to request.referrer
  end
  def create_table
    name = params[:name] # TODO: Sanitize name
    out = `rails g model #{name} uuid:string && rails db:migrate`
    #raise "Broken. Use rails g model #{name} uuid:string. Open the migration. Add null:false. Add add_index :table_name_with_s, :uuid. 
#Then run rails db:migrate."
    # TODO: Write my own migration, to add null false

    redirect_to request.referrer
  end
  def inline_image
    if params[:id]
      image = Image.find(params[:id])
      send_file Rails.root.join('views').join(image.path.delete_prefix("/")), disposition: 'inline'
    elsif params[:name]
      image = Image.find_by_name(params[:name])
      send_file Rails.root.join('views').join(image.path.delete_prefix("/")), disposition: 'inline'
    elsif params[:path]
      image = Image.find_by_path(params[:path])
      logger.info Rails.root
      logger.info Rails.root.join('views')
      logger.info Rails.root.join('views').join(image.path.delete_prefix("/"))
      send_file Rails.root.join('views').join(image.path.delete_prefix("/")), disposition: 'inline'
    end
  end
  def find_new_images
    p = Rails.root.join('views')
    p.glob("**/*").each do |file|
      next if File.directory?(file) # skip the loop if the file is a directory
      path = file.to_s[p.to_s.length..-1]
      if helpers.image? file and not Image.find_by_path(path)
        im = Image.new
        im.path = path
        im.name = Pathname.new(path).basename
        im.save!
      end
      #Image.new.save!
    end 
  end

#    # This is safer than to check for the file directly 
#    p = Rails.root.join('public').join('apps')
#    Dir.entries(p).each {|n|
#      next if n == "."
#      next if n == ".."
#
#      without_ext = File.basename(n)[0..-File.extname(n).size-1]
#      render file: p.join(n) and return if name == without_ext
#    }
#
#    # Also check in the subfolders, only one level deep though
#    dirs.each {|d|
#      Dir.entries(p.join(d)).each {|n|
#      }
#    }
#
#    #@files = Dir.entries(Rails.root.join("views")).reject {|n| n == "." or n == ".."}
#    # TODO: Test . and .. is safe and does not work
#    @folder = params[:folder] || ""
#    if params[:folder]
#      r = Rails.root.join("views").join(params[:folder]) # FIXME: REALLY NOT SAFE
#      items = Dir.entries(r).reject {|n| n == "."}
#    else
#      r = Rails.root.join("views")
#      items = Dir.entries(r).reject {|n| n == "." or n == ".."}
#    end
#    @images = []
#    @files = []
#    @folders = []
#    items.each do |i|
#      @folders << i && next if File.directory?(r.join(i))
#      @images << i && next if image?(r.join(i))
#      @files << i
#    end
#    #@images = items.select { |n| image?(r.join(n)) }.map {|n| Pathname(@folder).join(n)}
#    #@files = items.reject {|n| File.directory?(r.join(n))}
#    #@folders = items.select {|n| File.directory?(r.join(n))}
#
#    render file: Rails.root.join('public').join('apps').join(name)
  #def show
  #  name = File.basename(params[:name]) # sanitize name to avoid malicious users to read any file
  #  render file: Rails.root.join('public').join('apps').join(name)
  #end
end
