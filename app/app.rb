module Ensemble

	class App < Sinatra::Base

		get '/' do
      response= RestClient.get("#{ENV["BASE_URL"]}/events")
      if response != nil
        events= JSON.parse(response)
        erb :index, :locals => {:events => events, :client => events[0]["client"], :value => params[:search], }
      else
        erb :index, :locals => {:events => Hash.new}
      end
    end

    get '/events' do
      content_type :json
      response= RestClient.get("#{ENV["BASE_URL"]}/events")
      events= JSON.parse(response)
      events.to_json
    end

    get '/clients' do
      content_type :json
      response= RestClient.get("#{ENV["BASE_URL"]}/clients")
      clients= JSON.parse(response)
      clients.to_json
    end

    get '/clients.erb' do
      response= RestClient.get("#{ENV["BASE_URL"]}/clients")
      client= JSON.parse(response)
      response= RestClient.get("#{ENV["BASE_URL"]}/events")
      events= JSON.parse(response)
      erb :clients, :locals => {:client => client, :name => client[0]["name"], :events => events}
    end
  end
end
