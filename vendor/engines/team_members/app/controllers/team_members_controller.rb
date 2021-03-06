class TeamMembersController < ApplicationController

  before_filter :find_all_team_members
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @team_member in the line below:
    present(@page)
  end

  def show
    @team_member = TeamMember.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @team_member in the line below:
    present(@page)
  end

protected

  def find_all_team_members
    @team_members = TeamMember.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/team_members").first
  end

end
