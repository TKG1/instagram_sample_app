class CommentsController < ApplicationController
  def create
    comment = current_user.comments.build(content: params[:content], post_id: params[:post_id])
    if comment.save
      flash[:success] = 'コメントしました'
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = 'コメントできませんでした'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    comment = current_user.comments.find(params[:id])
    comment.destroy!
    redirect_back(fallback_location: root_path)
  end
end
