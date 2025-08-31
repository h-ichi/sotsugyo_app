class DiariesController < ApplicationController
  def index
    @diaries = Diary.order(diary_date: :desc)
  end

  def show
    @diary = Diary.find(params[:id])
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      redirect_to @diary, notice: "日記を作成しました"
    else
      render :new
    end
  end

  private

  def diary_params
    params.require(:diary).permit(:title, :diary_date, :content, :image)
  end
end
