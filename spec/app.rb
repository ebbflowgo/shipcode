require 'pp'

module Example
  class App < Sinatra::Base
    enable :sessions

    set :github_options, {
      :scopes    => "user",
      :secret    => ENV['SECRET FROM GITHUB'],
      :client_id => ENV['CLIENT ID FROM GITHUB'],
    }

    register Sinatra::Auth::Github

    helpers do
      def repos
        github_request("user/repos")
      end
    end

    get '/' do
      authenticate!
      "Hello there, #{github_user.login}!"
    end

    get '/orgs/:id' do
      github_organization_authenticate!(params['id'])
      "Hello There, #{github_user.name}! You have access to the #{params['id']} organization."
    end

    get '/publicized_orgs/:id' do
      github_publicized_organization_authenticate!(params['id'])
      "Hello There, #{github_user.name}! You are publicly a member of the #{params['id']} organization."
    end

    get '/teams/:id' do
      github_team_authenticate!(params['id'])
      "Hello There, #{github_user.name}! You have access to the #{params['id']} team."
    end

    get '/logout' do
      logout!
      redirect 'https://github.com'
    end
  end
end
