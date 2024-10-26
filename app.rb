require "sinatra"
require "sinatra/reloader"
require "active_support/all" #need this for the float

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
  @sq_results=@sq_no**2.to_f
  erb(:square_results)
end

get ("/square_root/new") do
  erb(:square_root)
end

get ("/square_root/results") do
  @sq_root_no= params.fetch("sqrt_no").to_i
  @sq_root_results=@sq_root_no**(1.0/2).to_f.round(14)

  erb(:square_root_results)

end

get ("/payment/new") do
  erb(:payment)
end

get ("/payment/results") do
  
  @apr = (params.fetch("apr").to_f)
  @principal = params.fetch("principal").to_f
  @years = params.fetch("years").to_i

  ptop = (@apr / 100.0 / 12)*@principal
  pbottom = (1-((1+ @apr/100.0/12)** (-@years *12)))

  payment_o = ptop/pbottom
  @payment = payment_o.round(4).to_fs(:currency)
  @aprp="#{(@apr).round(4)}%"
  
  erb(:payment_results)

end

get ("/random/new") do
  erb (:random)
end

get ("/random/results") do
  @min=params.fetch("min").to_f
  @max=params.fetch("max").to_f
  @random= rand(@min...@max).round(14)
  erb(:random_results)
end
