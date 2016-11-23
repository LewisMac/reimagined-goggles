require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('models/wizard_maker')
require_relative('models/grand_designs')

get '/' do
  return 'yeay'
end

get '/students' do
  @students = Wizard.all()
  erb(:index)
end

get '/students/new' do
  @house_names = House.all_names()
  erb(:new)
end

post '/students' do
  wizard = Wizard.new( params )
  wizard.save
  redirect to('/students')
end

post '/students/:id/delete' do
  Wizard.delete( params[:id] )
  redirect to('/students')
end

get '/students/:id' do
  @student = Wizard.find( params[:id] )
  erb(:show)
end

get '/house/new' do
  erb(:new_house)
end

post '/house' do
  house = House.new( params )
  house.save
  redirect to('/students')
end