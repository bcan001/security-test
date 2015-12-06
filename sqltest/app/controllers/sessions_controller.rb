class SessionsController < ApplicationController
	def new
	end
	def create
		# @user = User.find_by(:username => session_params[:username]).try(:authenticate, session_params[:password])
		# binding.pry

		# @user = User.where({username: session[:username],email: session[:email]}).first
		# @user = User.select {|user| (user.username == session[:username]) && (user.email == session[:email]) }

		# sql = "Select * From users Where username=#{form_login[:username]} and email=#{form_login[:email]}"
		# @user = ActiveRecord::Base.connection.execute(sql).first



		# Client.find_by_sql("SELECT * FROM clients
		#   INNER JOIN orders ON clients.id = orders.client_id
		#   ORDER BY clients.created_at desc")
		# # =>  [
		#   #<Client id: 1, first_name: "Lucas" >,
		#   #<Client id: 2, first_name: "Jan" >,
		#   # ...
		# # ]
		# binding.pry

		@user = User.find_by_sql(
			"SELECT * FROM users
			Where username='#{params[:form_login][:username]}'
			and email='#{params[:form_login][:email]}'"
		)

		# binding.pry


		redirect_to root_path(user: @user.inspect)

		# if @user
		# 	session[:user_id] = @user.id
		# 	redirect_to root_path
		# else
		# 	flash[:notice] = "Please enter correct credentials"
		# 	render 'sessions/new'
		# end


	end
	def destroy
		session.clear
		flash[:notice] = "Log out successful"

		redirect_to root_path
	end

	# private

	# def session_params
	# 	params.require(:session).permit(:username,:email,:password)
	# end

end