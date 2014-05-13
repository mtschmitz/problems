class OpinionsController < ApplicationController
before_filter :authenticate_user!, only: [:create, :destroy]

  respond_to :html, :js
  
  def create
    @problem = Problem.find(params[:opinion][:problem_id])
    current_user.opinionate!(@problem, params[:opinion][:updown] )
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end
    
  def update      
    @opinion = Opinion.find(params[:id]).problem
    if @opinion.update_attributes(opinion_params)
    current_user.opinion(@problem)
    respond_to do |format|
      format.html { redirect_to items_url }
      format.js
    end
    end
  end

  private
    def opinion_params
    params.require(:opinion).permit(:id, :updown)
    end                               
end

      