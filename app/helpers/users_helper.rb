module UsersHelper

  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def time_to_minutes(time_str, km)  
    hours, minutes, seconds = time_str.split(":").map{|str| str.to_i}  
    minutes = hours * 60 + minutes + seconds / 60
    raw_pace = minutes / km
    int_pace = raw_pace.to_int
    pace_seconds = ((raw_pace - int_pace) * 60).to_int
    "#{ int_pace }:#{ pace_seconds }"

  rescue          # do any additional error handling here  
    -1  
  end   

end