module ApplicationHelper
  require 'net/http'
  require 'digest/md5'

  def avatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    if user.image
      user.image
    elsif gravatar?(user.email)
      "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identical&s=150"
    else
      'default-user-icon.png'
    end
  end

  private

  def gravatar?(email, options = {})
    hash = Digest::MD5.hexdigest(email.to_s.downcase)
    options = { :rating => 'x', :timeout => 2 }.merge(options)
    http = Net::HTTP.new('www.gravatar.com', 80)
    http.read_timeout = options[:timeout]
    response = http.request_head("/avatar/#{hash}?rating=#{options[:rating]}&default=http://gravatar.com/avatar")
    response.code != '302'
  rescue StandardError, Timeout::Error
    true  # Don't show "no gravatar" if the service is down or slow
  end
end
