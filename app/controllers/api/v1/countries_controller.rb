class Api::V1::CountriesController < ActionController::API

  def index
    @countries = Country.all
    render json: @countries
      .as_json(except: %i[id created_at updated_at])
  end
end