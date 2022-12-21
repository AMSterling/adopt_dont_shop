class Admin::ApplicationsController < ApplicationController
  def index
    @applications = Application.all
  end

  def show
    @application = Application.find(params[:id])
  end

  def update
    @application = Application.find(params[:id])
    @pets = @application.pets
    @app_pets = @application.application_pets
    if params[:approved]
      @app = @app_pets.where(pet_id: params[:approved])
      @app.update(approved: 'true')
      approval
    else params[:rejected]
      @app = @app_pets.where(pet_id: params[:rejected])
      @app.update(approved: 'false')
      rejected
    end
    redirect_to "/admin/applications/#{@application.id}"
  end

  def approval
    @app_pets.each do |app|
      if app.approved == 'true'
        app.pet.update(adoptable: false)
      end
    end
  end

  def rejected
    if @app_pets.any? { |app| app.approved == 'false' } && @pet_apps.none? { |app| app.approved == nil }
      @application.update(status: 'Rejected')
    end
  end
end
