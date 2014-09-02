module AdminHelper
	def menu_navegacion2(opciones)
		html = '<div class="navbar navbar-inverse navbar-fixed-top nav-color" role="navigation">'
		html += '<div class="navbar-header">'
		html += '<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">'
		html += '<span class="sr-only">Toggle navigation</span>'
		html += '<span class="icon-bar"></span>'
		html += '<span class="icon-bar"></span>'
		html += '<span class="icon-bar"></span>'
		html += '</div>'
		html += '<div class="collapse navbar-collapse">'
		html += '<ul id="barra" class="nav navbar-nav nav-color">'
		for opcion in opciones
			html += '<li><a href=/admin/' +"#{opcion[0]}" + '>' + "#{opcion[1]}" + '</a></li>'
		end
		html += '</ul>'
		html += '</div>'
		html += '</div>'

		return html.html_safe
	end

	def crud_menu(menu)
		html = '<table class="table">'
		html += "<tr>"
		html += "<td><b>Controlador</b></td>"
		html += "<td><b>Acción</b></td>"
		html += "<td><b>Texto</b></td>"
		html += "<td></td>"
		html += "</tr>"
		campos_menu = menu.campos_menu.to_a 
		i = 0
		for campo in campos_menu
			html += "<tr>"
			html += "<td>"+ text_field_tag("controller#{i}","#{campo[:controller]}",:class => "form-control")+"</td>"
			html += "<td>"+ text_field_tag("action#{i}","#{campo[:action]}",:class => "form-control")+"</td>"
			html += "<td>"+ text_field_tag("text#{i}","#{campo[:text]}",:class => "form-control")+"</td>"
			html += "<td>"+ link_to('<button type="button" class="btn btn-default"><span class="glyphicon glyphicon-minus"></span></button>'.html_safe,{:action => "eliminar_campo_menu",:campo_id => "#{campo[:id]}" },method: :post) +"</td>"
			html += "</tr>"
			i += 1
		end
		html += "<tr>"
		html += "<td></td>"
		html += "<td></td>"
		html += "<td></td>"
		html += "<td>" + link_to('<button type="button" class="btn btn-default"><span class="glyphicon glyphicon-plus"></span></button>'.html_safe,{:action => "crear_campo_menu"},method: :post) + "</td>"
		html += "</tr>"
		html += "</table>"
		return html.html_safe
	end

	def crud_jumbotron(jumbotron)
		html = '<div class="row">'
		html += '<div class="col-md-4">'
		html += label_tag("Titulo") + text_field_tag("title","#{jumbotron[:title]}",:class => "form-control")
		html += '<br/>'
		html += label_tag("Texto") + text_area_tag("text","#{jumbotron[:text]}",:class => "form-control")
		html += '</div>'
		html += '<div class="col-md-4"><br/>'
		html += image_tag("#{jumbotron[:picture]}",:size => "200x200")
		html += '</div>'
		html += '</div>'
		html += '<div class="row">'
		html += '<div class="col-md-4 col-md-offset-4">'
		html += label_tag("Subir imagen") + file_field_tag(:picture,:class => "form-control")
		html += '</div>'
		html += '</div>'
		return html.html_safe
	end

	def crud_thumbnails(thumbnail_group)
		thumbnail_array = thumbnail_group.thumbnail
		cantidad = thumbnail_array.length
		num = 12/cantidad
		html = '<div class="row">'
		i = 0
		while i < cantidad
			html += '<div class="col-md-' + "#{num}" + '">'
			html += '<div class="thumbnail">'
			html += image_tag("#{thumbnail_array[i][:picture]}",:size => "200x200")
			html += '<div class="caption">'
			html += file_field_tag("picture#{i}",:class => "form-control")
			html += '<br/>'
			html += label_tag("Titulo")
			html += text_field_tag("title#{i}",thumbnail_array[i][:title],:class => "form-control")
			html += '<br/>'
			html += label_tag("Texto")
			html += text_area_tag("text#{i}",thumbnail_array[i][:text],:class => "form-control",:size => "25x7")
			html += "</div>"
			html += link_to('<button type="button" class="btn btn-default"><span class="glyphicon glyphicon-minus"></span></button>'.html_safe,{:action => "eliminar_thumbnail",:thumbnail_id => "#{thumbnail_array[i][:id]}" },method: :post)
			html += "</div>"
			html += "</div>"
			i += 1
		end
		html += '<div style="display:none">'
		html += text_field_tag("cantidad","#{i}")
		html += '</div>'
		html += link_to('<button type="button" class="btn btn-default"><span class="glyphicon glyphicon-plus"></span></button>'.html_safe,{:action => "crear_thumbnail"},method: :post)
		html += "</div>"
		return html.html_safe
	end
end
