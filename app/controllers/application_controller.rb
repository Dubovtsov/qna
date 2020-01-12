class ApplicationController < ActionController::Base
  helper_method :author_of?

  def author_of?(resource)
    current_user.id == resource.user_id
  end
end
