class Admin::SheltersController < ApplicationController
  def index
    @shelters = Shelter.all.order_by_name_desc
  end
end
