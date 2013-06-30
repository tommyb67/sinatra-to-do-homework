require 'pry'
require 'sinatra'
require 'pg'
require 'sinatra/reloader' if development?


# Root page with a link to the current To Do list
get '/' do
  erb :index
end

# Current list of to do's pulled from the db
get '/todos' do
  db = PG.connect(:dbname => 'to_dos', :host => 'localhost')
  sql = "select * from todo"
  @to_dos = db.exec(sql)
  db.close
    erb :todos
  end

# Show the details of a todo
get '/todo/:id' do
  id = params[:id]
  db = PG.connect(:dbname => 'to_dos', :host => 'localhost')
  sql = "select * from todo where id = #{id}"
  @todo = db.exec(sql).first
    db.close
  	erb :todo
end

post '/todo/:id' do
  activity = params[:activity]


end


# create todo
get '/create_todo' do
  erb :create_todo
end

# Create a todo by sending a POST request to this URL
post '/create_todo' do
  #This will send you to the newly created todo
  redirect to("/todo/#{id}")
end
