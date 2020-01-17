module ApplicationHelper
  def flash_class(level)
    if level == 'success'||  level == 'notice'
      'is-success'
    elsif level == 'alert'
      'is-danger'
    else
      'is-info'
    end
  end

  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.first_name, class: "gravatar")
  end
end
