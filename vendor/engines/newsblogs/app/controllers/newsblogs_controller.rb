class NewsblogsController < ApplicationController

  before_filter :find_all_newsblogs
  before_filter :find_page
  
  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @newsblog in the line below:
    present(@page)
  end

  def show
    @newsblog = Newsblog.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @newsblog in the line below:
    present(@page)
  end

protected

  def find_all_newsblogs
    @newsblogs = Newsblog.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/newsblogs").first
  end

end
