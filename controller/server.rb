require 'socket'
require 'sinatra'
require 'json'
require './models/user.rb'
require './models/database.rb'
require './models/user_projects.rb'
require './models/project.rb'
require 'sqlite3'

enable :sessions

set :port, 5000
set :server, 'thin'
set :bind, '0.0.0.0'
set :run, true
set :environment, :production
set :server_name, 'jade-stardust-790401.netlify.app'

set('views', '../views')


$id
get '/projects' do
    Project.allProjects.collect do |row|
        row.to_hash.to_json
    end
end

get '/' do
    erb :welcome
end

get '/signup' do 
    erb :signup
end
post '/signup' do
    puts params
   User.createUser(params)
    "user created"
    redirect '/login'
end

get '/login' do 
    erb :login
end

post '/login' do
    p params['email']
    p params['password']
    users=User.allUsers
    $user=users.filter { |user| user.email==params['email'] && user.password==params['password']}.first
    if($user && params['email']!="")
        session[:user_id]=$user.id
        $id=$user.id
        $name=$user.userName
        $password=$user.password
        "User #{$user.userName}, #{$user.email} signed in #{$user.id}"
        redirect '/home'
    else
        alert("Continue?", button_no: "Nope", button_cancel: "Quit", parent: self) 
    end
end

get '/home' do
    erb :index
end

get '/projectCreation' do
    erb :create_project
end

post '/projectCreation' do
    Project.createProject(params)
    UserProjects.creator(params['project_name'],$id,$name)
    "project created #{$id} #{params['project_name']}"
    redirect '/home'
end

get '/editProject' do
    erb :edith_project
end
=begin
post '/editProjectName' do
    Project.updateProject(,"project_name",params['project_name'])
end

post '/editProjectDesc' do
    Project.updateProject(,"description",params['description'])
end

post '/editProjectCont' do
    Project.updateProject(,"contents",params['contents'])
end
=end
post '/sign_out' do
    if session[:user_id]
        session.clear
        redirect '/'
    end
end

get '/editUser' do
    erb :edith_user
end

get '/showProject' do
    erb :show_project
end
post '/editUser' do
    p params
    if(params['c_password']==$password)
        if(params['n_userName']!="")
            User.updateUser($id,"userName",params['n_userName'])
        end
        if(params['n_email']!="")
            User.updateUser($id,"email",params['n_email'])
        end
        if(params['n_password']!="")
            User.updateUser($id,"password",params['n_password'])
        end
    end
    redirect '/home'
end

post '/user' do
    if session[:user_id]
        User.destroy($id)
        "Successfully deleted you will be redirected to welcome page"
        redirect '/'
    end
end


post '/project' do
    $del = params['custId']
    Project.deleteProject($del)
    redirect '/home'
end
