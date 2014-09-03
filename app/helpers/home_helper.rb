module HomeHelper
	def menu_navegacion(opciones)
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
			html += "<li><a href=/#{opcion[:controller]}/#{opcion[:action]}>#{opcion[:text]}</a></li>"
		end
		html += '</ul>'
		html += '</div>'
		html += '</div>'

		return html.html_safe
	end

	def jumbotron(jumbotron)
		html = '<div class ="jumbotron">'
		html += '<div class="row">'
		html += '<div class="col-md-6">'
		html += "<h1>#{jumbotron[:title]}</h1>"
		html += "<p>#{jumbotron[:text]}</p>"
		html += "</div>"
		html += '<div class="col-md-6">'
		html += image_tag("#{jumbotron[:picture]}",:class => "img-responsive",:size => "500x500")
		html += "</div>"
		html += "</div>"
		html += "</div>"
		return html.html_safe
	end

	def thumbnail_group(thumbnail_group)
		thumbnail_array = thumbnail_group.thumbnail
		cantidad = thumbnail_array.length
		num = 12/cantidad
		html = '<div class="row">'
		i = 0
		while i < cantidad
			html += '<div class="col-md-' + "#{num}" + '">'
			html += '<div class="thumbnail mi-thumbnail">'
			html += image_tag("#{thumbnail_array[i][:picture]}",:size => "200x200")
			html += '<div class="caption">'
			html += "<h3>#{thumbnail_array[i][:title]}</h3>"
			html += '<p class="text-justify">' + "#{thumbnail_array[i][:text]}</p>"
			html += "</div>"
			html += "</div>"
			html += "</div>"
			i += 1
		end
		html += "</div>"
		return html.html_safe
	end
end
