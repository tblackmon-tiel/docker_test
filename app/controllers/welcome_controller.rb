class WelcomeController < ApplicationController
  def index
    conn = Faraday.new(
      url: "https://api.unsplash.com",
      params: {client_id: Rails.application.credentials.unsplash[:client_id]}
    )

    response = conn.get("/photos/random/?query=old person")
    parsed = JSON.parse(response.body)
    render json: parsed
  end
end