module ItemHelper

  def post_status(data)
    login_in_as_user(data[:user])
    fill_in "status", with: data[:content]
    click_button 'update'
  end

  def post_another_status(status)
    fill_in "status", with: status
    click_button 'update'
  end

  def post_comment(comment)
    fill_in (:comment), with: comment
    click_button 'comment'
  end

  def post_first_comment(comment)
    all("#comment").first.set comment
    click_button 'comment'
  end
end
