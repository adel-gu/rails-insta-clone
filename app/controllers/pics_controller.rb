class PicsController < ApplicationController
  before_action :find_pic, only: %i[show edit update destroy]

  def index
    @pics = Pic.all.order('created_at DESC')
  end

  def show; end

  def new
    @pic = current_user.pics.build
  end

  def create
    @pic = current_user.pics.build(pic_params)

    if @pic.save
      redirect_to @pic, notice: 'Yesss! It was posted'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @pic.update(pic_params)
      redirect_to @pic, notice: 'Congrats! Pic was updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @pic.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def pic_params
    params.require(:pic).permit(:title, :description, :image)
  end

  def find_pic
    @pic = Pic.find(params[:id])
  end
end
