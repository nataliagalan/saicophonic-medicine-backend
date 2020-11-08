class Api::V1::TagsController < ApplicationController

  def index
    tags = Tag.all
    render json: tags
  end 

  def create

  end #end of create action

  def show

  end #end of show action

end #end of tc
