class AdminController < ApplicationController
  layout "admin"
  before_filter :validar_sesion
  def index
  	id = session[:usuario]["id"]
  	usuario = Usuario.find(id)
  	@session = usuario.usuario
    @menu = usuario.menu
    @jumbotron = usuario.jumbotron
    @thumbnail_group = usuario.thumbnail_group
  end

  def cerrar_sesion
  	session[:usuario] = nil
  	redirect_to "/login/index"
  end

  def validar_sesion
  	if session[:usuario] == nil
  		redirect_to "/login/index"
  	end	
  end

  def eliminar_campo_menu
    id = session[:usuario]["id"]
    usuario = Usuario.find(id)
    @menu = usuario.menu
    usuario.menu.campos_menu.find(params[:campo_id]).destroy
    respond_to do |format|
      format.html {redirect_to("/admin/index")}
      format.js
    end
  end

  def crear_campo_menu
    id = session[:usuario]["id"]
    usuario = Usuario.find(id)
    @menu = usuario.menu
    campos_menu = usuario.menu.campos_menu
    campos_menu << CamposMenu.create(:controller => "home", :action => "default", :text => "Default")
    usuario.menu.campos_menu = campos_menu
    usuario.save
    respond_to do |format|
      format.html {redirect_to("/admin/index")}
      format.js
    end
  end

  def actualizar_menu
    i = 0
    h = []
    while i < ((params.length - 5)/3)
      h << {("controller") => params["controller#{i}"], ("action") => params["action#{i}"], ("text") => params["text#{i}"]}
      i += 1
    end
    id = session[:usuario]["id"]
    campos_menu = Usuario.find(id).menu.campos_menu
    i = 0
    for campo in h
      campos_menu[i].controller = campo['controller']
      campos_menu[i].action = campo['action']
      campos_menu[i].text = campo['text']
      campos_menu[i].save
      i += 1
    end
    respond_to do |format|
      format.html {redirect_to("/admin/index")}
      format.js
    end
    
  end

  def actualizar_jumbotron
    id = session[:usuario]["id"]
    jumbotron = Usuario.find(id).jumbotron
    if params[:picture] != nil
      imagen = params[:picture]
      nombre_imagen = imagen.original_filename
      directorio = "#{Rails.root}" + "/app/assets/images/" + nombre_imagen
      File.open(directorio,"wb"){|f| f.write(imagen.read)}
      jumbotron.picture = nombre_imagen
    end
    jumbotron.title = params[:title]
    jumbotron.text = params[:text]
    jumbotron.save
    redirect_to("/admin/index")
  end

  def crear_thumbnail
    id = session[:usuario]["id"]
    thumbnail_array = Usuario.find(id).thumbnail_group.thumbnail
    thumbnail_array << Thumbnail.create(:title => "Default", :text => "Default", :picture => "default.png", :link => "default")
    @thumbnail_group = Usuario.find(id).thumbnail_group
    respond_to do |format|
      format.html {redirect_to("/admin/index")}
      format.js
    end
  end

  def actualizar_thumbnails
    i = 0
    h = []
    while i < Integer(params[:cantidad])
      h << {("title") => params["title#{i}"], ("text") => params["text#{i}"], ("picture") => params["picture#{i}"], ("link") => params["link#{i}"]}
      i += 1
    end
    id = session[:usuario]["id"]
    thumbnails = Usuario.find(id).thumbnail_group.thumbnail
    i = 0
    for thumbnail in h
      if h[i]['picture'] != nil
        imagen = h[i]['picture']
        nombre_imagen = imagen.original_filename
        directorio = "#{Rails.root}" + "/app/assets/images/" + nombre_imagen
        File.open(directorio,"wb"){|f| f.write(imagen.read)}
        thumbnails[i].picture = nombre_imagen
      end
      thumbnails[i].title = h[i]['title']
      thumbnails[i].text = h[i]['text']
      thumbnails[i].link = h[i]['link']
      thumbnails[i].save
      i += 1
    end
    redirect_to("/admin/index")
  end

  def eliminar_thumbnail
    id = session[:usuario]["id"]
    thumbnails = Usuario.find(id).thumbnail_group.thumbnail
    thumbnails.find(params[:thumbnail_id]).destroy
    @thumbnail_group = Usuario.find(id).thumbnail_group
    respond_to do |format|
      format.html {redirect_to("/admin/index")}
      format.js
    end
  end
end