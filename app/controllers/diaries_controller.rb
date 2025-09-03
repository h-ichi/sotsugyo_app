class DiariesController < ApplicationController
  before_action :authenticate_user!   # 👈 ログイン必須
  before_action :set_diary, only: [:show, :edit, :update, :destroy]

  def index
    @diaries = current_user.diaries.order(diary_date: :desc)
  end

  def show
  end

  def new
    @diary = current_user.diaries.new
  end

  def create
    @diary = current_user.diaries.new(diary_params)
    if @diary.save
      redirect_to @diary, notice: "日記を作成しました"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @diary.update(diary_params)
      redirect_to @diary, notice: "日記を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @diary.destroy
    redirect_to diaries_path, notice: "日記を削除しました。"
  end

  private

  def set_diary
    @diary = current_user.diaries.find(params[:id])  # 👈 他人の日記は見れない
  end

  def diary_params
    params.require(:diary).permit(:title, :diary_date, :content, :image)
  end
end
