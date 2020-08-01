class ApplicationController < ActionController::Base
  layout :dynamic_layout

  private

  def dynamic_layout
    admin_signed_in? ? "admin/application" : "application"
  end
end
