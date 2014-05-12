class StaticPagesController < ApplicationController
  def home
      @feed_items = Problem.unsolved_feed.paginate(page: params[:page])
  end

  def help
  end

  def about
  end
  
  def contact
  end
end
