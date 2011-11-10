class NeweventsController < ApplicationController

  before_filter :find_all_newevents
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @newevent in the line below:
    present(@page)
  end

  def show
    @newevent = Newevent.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @newevent in the line below:
    present(@page)
  end

protected

  def find_all_newevents
    @newevents = Newevent.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/newevents").first
  end

end
