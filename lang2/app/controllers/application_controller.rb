class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
    before_filter :fetch_menu

    def fetch_menu
        @menus = Menu.all
        @lid = 1
        #@lid = params.fetch(:language_id)
    end
    
    def lang_menu
        @langs = Language.all
    end
  
end
