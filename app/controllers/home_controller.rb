class HomeController < ApplicationController
	def index
		#@categories = Category.all
    @categories = current_user.categories
	end
end