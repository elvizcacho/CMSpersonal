class HomeController < ApplicationController
	before_filter :cargar_menu
	layout "home"

  def index
    @jumbotron = Usuario.find(1).jumbotron
    @thumbnail_group = Usuario.find(1).thumbnail_group
  end

  def portafolio
  end

private
  def cargar_menu
  	campos_menu = Usuario.find(1).menu.campos_menu.to_a
  	@array_hash = []
  	for campo in campos_menu
  		hash = {:controller => "#{campo.controller}", :action => "#{campo.action}", :text => "#{campo.text}"}
  		@array_hash << hash
  	end
  end
end
