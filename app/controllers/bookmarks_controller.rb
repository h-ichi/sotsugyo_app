class BookmarksController < ApplicationController
 def index
 end

 def create
  idea = Idea.find(params[:idea_id])
  current_user.bookmarked_ideas << idea
  redirect_to ideas_path, notice: "ブックマークしました！"
 end

 def destroy
  idea = Idea.find(params[:idea_id])
  current_user.bookmarked_ideas.delete(idea)
  redirect_to ideas_path, notice: "ブックマークを解除しました。"
 end
end
