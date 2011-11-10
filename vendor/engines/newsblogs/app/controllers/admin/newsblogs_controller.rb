module Admin
  class NewsblogsController < Admin::BaseController

    crudify :newsblog, :xhr_paging => true

  end
end
