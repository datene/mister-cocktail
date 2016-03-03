class DosesController < ApplicationController
  before_action :set_dose, only: [:create, :new]

  def index
    @doses = Dose.all
  end

  def show
    @dose
  end

  def new
    @dose = Dose.new
  end

  def create
    @dose = @cocktail.doses.build(dose_params)

    if @dose.save
      redirect_to cocktail_path(@dose.cocktail_id)
    else
      render 'new'
    end
  end

  def update
    if @dose.update(dose_params)
      redirect_to dose_path(@dose)
    else
      render 'edit'
    end
  end

  def destroy
    dose = Dose.find(params[:id])
    dose.destroy
    redirect_to cocktails_path
  end

  def edit
    @dose
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end

  def set_dose
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end
