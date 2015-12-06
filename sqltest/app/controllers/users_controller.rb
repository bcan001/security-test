class UsersController < ApplicationController
	def show
		# @user = User.find(params[:id])

		# @user = User.find(session[:user_id]) if session[:user_id]
		@user = params[:user]


	end
end