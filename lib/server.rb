require "pry"
require "sinatra"
require "shotgun"


questionaire_hash = {
  "Who are you going out with!?" => ["Parents", "Friends"],
  "Pick an adjective you will one day use to describe this night" => ["Nice", "Wild"]
}


results_hash = {
  "The Blue Dragon" => "classy restaurant with exotic food like eel and pig's tail!",
  "Top of the Hub"=> "high-class traditional steakhouse, overlooking Boston.",
  "Hong Kong" => "Time to get rachet!",
  "The Middle East" => "Time to chill out and listen to some awesome music with weird people, like yourself! (because you're probably weird)"
}
venue             = nil
venue_information = nil

get '/questionaire' do
  @questionaire_hash = questionaire_hash
  @question_id  = 1
  @answer_id    = 1

  erb :index
end


post '/questionaire' do
  @companions = params[:q1]
  @adjective  = params[:q2]


  if    @companions == "Parents" && @adjective == "Wild"
    venue = "The Blue Dragon"
  elsif @companions == "Parents" && @adjective == "Nice"
    venue = "Top of the Hub"
  elsif @companions == "Friends" && @adjective == "Wild"
    venue = "Hong Kong"
  elsif @companions == "Friends" && @adjective == "Nice"
    venue = "The Middle East"
  end


  results_hash.each do |key, value|
    if key == venue
      venue_information = results_hash[key]
    end
  end


  redirect '/result'
end


get '/result'do
  @venue = venue
  @venue_information = venue_information
  binding.pry
erb :result
end
















