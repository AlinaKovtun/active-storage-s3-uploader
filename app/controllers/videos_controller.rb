class VideosController < ApplicationController
  before_action :set_word, only: [:index, :new, :create]

  def new
    @word = Word.find(params[:word_id])
    @video = @word.videos.build
  end

  def create
    binding.pry
    @word.images.build(image_params.merge(revision: revision))

    respond_to do |format|
      if @video.save
        format.html { redirect_to @word, notice: "New revision was successfully created." }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @images.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @video = Video.new(video_params.merge(revision: revision))

    # @word.images.build(image_params.merge(revision: revision))

    respond_to do |format|
      if @word.save
        format.html { redirect_to @word, notice: "New revision was successfully created." }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @videos.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_word
      @word = Word.find(params[:word_id])
    end

    def video_params
      params.require(:video).permit(:attachment, :word_id)
    end

    def revision
      @word.videos.count + 1
    end
end
