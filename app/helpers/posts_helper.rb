module PostsHelper
  def check_login(post)
    "Author: #{post.user.username}" if signed_in?
  end

  def check_errors(_post)
    @post.errors.any?
  end

  def check_user_login
    if user_signed_in?
      render 'form'
    else
      aredirect_to new_session_path
    end
  end
end
