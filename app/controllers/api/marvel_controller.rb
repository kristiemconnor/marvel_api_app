class Api::MarvelController < ApplicationController

  def index
    @characters = HTTP.headers({ "X-User-Email" => ENV["API_EMAIL"], "Authorization" => "Token token=#{ENV["API_KEY"]}" }).get("
https://gateway.marvel.com:443/v1/public/characters?name=Spider-Man
").parse["data"]["results"]
    render 'index.json.jb'
  end
end