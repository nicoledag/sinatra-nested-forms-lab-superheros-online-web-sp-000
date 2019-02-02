require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }
    get "/" do
          erb :team
        end

        @heros = params[:team][:member].map do |hero_data|
               hero = Member.new(hero_data)
               hero.team = @team
               hero.save
               hero
             end

             erb :super_hero
           end



    end
