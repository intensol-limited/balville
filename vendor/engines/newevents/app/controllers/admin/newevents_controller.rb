module Admin
  class NeweventsController < Admin::BaseController

    crudify :newevent, :xhr_paging => true

  end
end
