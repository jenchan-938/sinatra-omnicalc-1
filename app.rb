require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

get ("/square/new") do
  erb(:square) 
end

get ("/square/results") do
  @sq_no = params.fetch("number").to_i
  pp @sq_no
  erb(:square_results)

end
