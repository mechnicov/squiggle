module UsersHelper
  def status(user)
    return '(администратор)' if user.is_admin
    '(пользователь)'
  end
end
