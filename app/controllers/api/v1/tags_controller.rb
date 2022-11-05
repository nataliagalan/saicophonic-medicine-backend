class Api::V1::TagsController < ApplicationController

  def index
    tags = Tag.all
    render json: tags
  end 

  def search
    elastic_query = {
      operator: "or", 
      fields: [:name], 
      misspellings: {below: 1, edit_distance: 1}, 
      order: {_score: :desc}
    }
    tags = Tag.search(params[:query],  **elastic_query)
    if response
      render json: tags
    else
      render json: { error: 'did not find anything' }
    end
  end

  def create

  end

  def show

  end

end
