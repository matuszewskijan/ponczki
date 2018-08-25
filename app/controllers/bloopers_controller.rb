class BloopersController < ApplicationController
  before_action :set_blooper, only: [:show, :edit, :update, :destroy]

  # GET /bloopers
  def index
    @bloopers = Blooper.all
  end

  # GET /bloopers/1
  def show; end

  # GET /bloopers/new
  def new
    @blooper = Blooper.new
  end

  # GET /bloopers/1/edit
  def edit; end

  # POST /bloopers
  def create
    @blooper = Blooper.new(blooper_params)

    if @blooper.save
      redirect_to @blooper, notice: "Blooper was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /bloopers/1
  def update
    if @blooper.update(blooper_params)
      redirect_to @blooper, notice: "Blooper was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /bloopers/1
  def destroy
    @blooper.destroy
    redirect_to bloopers_url, notice: "Blooper was successfully destroyed."
  end

  private

  def set_blooper
    @blooper = Blooper.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def blooper_params
    params.require(:blooper).permit(:user_id, :device, :description, :time, :finder_id)
  end
end
