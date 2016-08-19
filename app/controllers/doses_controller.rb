class DosesController < ApplicationController
  before_action :set_cocktail, only: [:create]
  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end
  end
  def destroy
    # @cocktail = Cocktail.find(params[:id])
    @dose = Dose.find(params[:id])
    cocktail_id = @dose.cocktail_id
    @dose.destroy
    redirect_to cocktail_path(cocktail_id)
  end

  private
  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
