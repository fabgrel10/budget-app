class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: 'replay', raise: false

  def index; end
end
