module ApplicationHelper
  def redirected?
    params[:redirect]
  end
end
