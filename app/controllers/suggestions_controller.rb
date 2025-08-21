class SuggestionsController < ApplicationController
  def new
    # フォーム表示用
  end

  def create
    @suggestions = OpenaiSuggestionService.new(
      adults: params[:family_adults],
      children: params[:family_children],
      children_ages: params[:children_ages],
      interests: params[:interests],
      budget: params[:budget],
      area: params[:area],
      weather: params[:weather]
    ).call

    session[:suggestions] = @suggestions
    redirect_to suggestion_path(1) # 仮にID 1
  end

  def show
    @suggestions = session.delete(:suggestions) || "提案はまだありません"
  end
end
