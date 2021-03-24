class VideosController < ApplicationController
  before_action :find_word, only: [:index, :create]
  before_action :set_video, only: [:show, :destroy]

  def index
    @videos = @word.videos.all
  end

  def show
  end

  def new
    @word = Word.find(params[:word_id])
    @video = Video.new(:word_id => params[:word_id])
  end

  def create
    @word.videos.build(video_params.merge(revision: revision))

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

  def edit
  end

  def update
  end

  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url, notice: "Video was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def find_word
      @word = Word.find(params[:word_id])
    end

    def set_video
      @video = Video.find(params[:id])
    end

    def video_params
      params.require(:video).permit(:attachment)
    end

    def revision
      @word.videos.count + 1
    end
end
