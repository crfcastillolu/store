require 'sinatra'
require 'sinatra/activerecord'
require 'better_errors'
require 'pry'
require './models/user.rb'
require './models/item.rb'

configure :development do
 use BetterErrors::Middleware
 BetterErrors.application_root = __dir__
end

get '/' do
  redirect '/store'
end


# USERS ----------------------------------

# Store index
get '/store' do
	@users=User.all
	erb :index
end

# Add new user
get '/store/new' do
	erb :new
end

post '/store' do
	User.create({name: params[:name], last_name: params[:last_name], nickname: params[:nickname]})
	redirect to ("/")
end	



# ITEMS -----------------------------------------------

# Show items
get '/store/:id' do
	@user=User.find(params[:id])
	@items=@user.items
	erb :show
end

post '/store/:id' do
	@user= User.find(params[:id])
	@user.items.create({brand: params[:brand], name: params[:name], price: params[:price]})
	redirect to ("/store/:id")
end

# Show user information
get '/store/:id' do
	@user=User.find(params[:id])
	erb :show
end	

# Edit user
get '/store/:id/edit' do
	@user = User.find(params[:id])
	erb :edit
end	

put '/store/:id' do
	user = User.find(params[:id])
	binding.pry
	user.name = params[:name]
	user.last_name= params[:last_name]
	user.nickname= params[:nickname]
	user.save
	redirect '/store/' + params[:id]
end

# Delete user
delete '/store/:id' do
	user=User.find(params[:id])
	user.destroy
	redirect '/'
end	


