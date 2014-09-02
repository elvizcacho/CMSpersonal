class LoginController < ApplicationController
  def index
  	if request.post?
  		if(Usuario.where(:usuario => params[:usuario]).count != 0 and Usuario.where(:password => params[:password]).count != 0)
  			redirect_to("/admin/index")
  			id = Usuario.where(:usuario => params[:usuario]).to_a[0].id
  			session[:usuario] = {:id => id}
  		else
  			render :text => "contraseña o usuario invalidos"
  		end
  	else
  		if session[:usuario] != nil
  			redirect_to("/admin/index")
  		end
  	end
  	 	
  end
end
