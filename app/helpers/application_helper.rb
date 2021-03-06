module ApplicationHelper
  def flash_class(level)
    if level == 'success'
      'is-success'
    elsif level == 'notice'
      'is-success'
    elsif level == 'alert'
      'is-danger'
    else
      'is-info'
    end
  end

  def gravatar_for(user)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.first_name, class: 'gravatar')
  end

  def gravatar_or_facebook_img(user)
    user.image_link ? image_tag(user.image_link) : gravatar_for(user)
  end

  def find_like_id(post)
    @like_id = post.likes.find { |like| like.liker_id == current_user.id }
  end

  def list_likers(post)
    first_liker = post.likes.first.liker
    second_liker = post.likes.second.liker if post.likes.count > 1
    if post.likes.count == 1
      first_liker.first_name
    elsif post.likes.count == 2
      first_liker.first_name + ' and ' + second_liker.first_name
    else
      "#{first_liker.first_name}, #{second_liker.first_name} and #{(post.likes.count - 2)} more liked this post."
    end
  end

  def count_likes(post)
    list_likers(post) if post.likes.any?
  end

  def find_comment(post)
    @comments = post.comments
  end

  def count_comments(post)
    "#{post.comments.count} comments" if post.comments.any?
  end

  def find_friendship_id(user)
    @friendship_id = current_user.friendships.find { |friendship| friendship.friend_id == user.id }
  end

  def find_inverse_friendship_id(user)
    @friendship_id = current_user.inverse_friendships.find { |friendship| friendship.user_id == user.id }
  end

  def all_rooms
    @rooms = Room.all
  end
end
