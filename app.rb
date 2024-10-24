require "sinatra"
require "sinatra/reloader"
require "active_support/all" #need this for the float s

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
  
  @apr_o= (params.fetch("apr").to_f)/(100*12)
  @apr=@apr_o.to_fs(:percentage, { :precision => 0 } ) 
  @principal = params.fetch("principal").to_f
  @years = (params.fetch("years").to_i)*12
  @num = @apr*@principal
  @den = 1- (1+@apr)**(-@years) #do formatting in the view format or create a separate variable for the formatted version 
  @monthly_p = @num/@den
  
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
