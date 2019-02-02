require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }
    get "/" do
          erb :team
        end

    post '/teams' do

    @team = Team.new(name: params[:team][:name], motto: params[:team][:motto])

    @heros = params[:team][:member].map do |hero_data|
           hero = Member.new(hero_data)
            hero.team = @team
            hero.save
            hero
         end

          erb :super_hero
       end



    end
