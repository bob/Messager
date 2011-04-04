class Notifier < ActionMailer::Base
  default :from => "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.new_comment.subject
  #
  def new_comment(comment)
    if comment.commentable.instance_of?(User)
      user_email = comment.commentable.email
      @followlink = profile_url
    elsif comment.commentable.instance_of?(Message)
      user_email = comment.commentable.user.email
      @followlink = message_url(comment.commentable)
    end
    
    @username = comment.user.email

    mail :to => user_email, :subject => "New comment"
  end
  
end
