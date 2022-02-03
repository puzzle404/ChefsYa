class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def chefs
    @chefs = User.where(chef: true)
  end
end
