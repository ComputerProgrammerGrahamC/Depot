class ApplicationController < ActionController::Base
  puts "Start"
  before_filter :set_i18m_locale_from_params
  before_filter :authorize
  protect_from_forgery

  private

  	def current_cart
  		Cart.find(session[:cart_id])
  	rescue ActiveRecord::RecordNotFound
  		cart = Cart.create
  		session[:cart_id] = cart.id
  		cart
  	end

  protected

    def set_i18m_locale_from_params
      if params[:locale]
        if I18n.available_locales.include?(params[:locale].to_sym)
          I18n.locale = params[:locale]
        else
          flash.now[:notice] = "#{params[:locale]} translation not available"
        end
      end
    end

    def default_url_options
      puts "Default"
      { :locale => I18n.locale }
    end

  	def authorize
      puts "authorizing"
      puts User.find_by_id(session[:user_id])
  		unless User.find_by_id(session[:user_id])
  			redirect_to login_url, :notice => "Please log in"
  		end
  	end
end
