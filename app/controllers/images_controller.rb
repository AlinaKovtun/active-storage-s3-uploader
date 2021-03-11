class ImagesController < ApplicationController
  before_action :find_word, only: [:index, :create]
  before_action :set_image, only: [:show, :destroy]

  def index
    @images = @word.images.all
  end

  def show
  end

  def new
    @word = Word.find(params[:word_id])
    @image = Image.new(:word_id => params[:word_id])
  end

  def create
    @word.images.build(image_params.merge(revision: revision))

    respond_to do |format|
      if @word.save
        format.html { redirect_to @word, notice: "New revision was successfully created." }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @images.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: "Image was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def find_word
      @word = Word.find(params[:word_id])
    end

    def set_image
      @image = Image.find(params[:id])
    end

    def image_params
      params.require(:image).permit(:attachment)
    end

    def revision
      @word.images.count + 1
    end
end
