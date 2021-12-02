class CommentsController < ApplicationController
  def create
    comment = current_user.comments.build(content: params[:comment][:content], post_id: params[:post_id])
    if comment.save
      flash[:success] = t('.success')
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = t('.fail')
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    comment = current_user.comments.find(params[:id])
    comment.destroy!
    flash[:success] = t('.success')
    redirect_back(fallback_location: root_path)
  end
end
