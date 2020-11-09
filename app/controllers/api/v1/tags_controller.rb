class Api::V1::TagsController < ApplicationController

  def index
    tags = Tag.all
    render json: tags
  end 

  def search
    elastic_query = {
      operator: "or", 
      # fields: [{"name" => :text_middle,}], 
      fields: [:name], 
      misspellings: {below: 1, edit_distance: 1}, 
      order: {_score: :desc}
      # debug: true

    #   misspellings: false,
    #   include a where clause so I'm only searching records returned by the other filters
    #   where: { id: listings_ids },
    #   page: params[:page],
      # per_page: 2
    }

    tags = Tag.search(params[:query], elastic_query)

    if response
      render json: tags
    else
      render json: { error: 'did not find anything' }
    end
  end #end of search action


  def create

  end #end of create action

  def show

  end #end of show action

end #end of tc
