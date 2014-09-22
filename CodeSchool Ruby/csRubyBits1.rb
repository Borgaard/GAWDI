=begin
Ruby! Level 1: Expressions

Bad code, good code, excellent code:
=end

# bad: technically correct, but
if ! tweets.empty?
    puts "timeline:"
    puts tweets
end

# good: unless is more intuitive. unless empty, do this
unless tweets.empty?
    puts "Timeline:"
    puts tweets
end

# bad: unless + else is confusing
unless tweets.empty?
    puts "Timeline:"
    puts tweets
else
    puts "No tweets found - better follow some people!"
end

# good: switch order around, makes sense to reader
if tweets.empty?
    puts "No tweets found - better follow some people!"
else
    puts "Timeline:"
    puts tweets
end

# In Ruby, nil is treated as false.
# bad
if attachment.file_path != nil
    attachment.post
end

# good: nil is treated as false, so exclude
if attachment.file_path
    attachment.post
end

=begin 
In Ruby, sometimes conditionals might surprise 
you with what is true and false:
An empty string is true: ""
A 0 is true: 0
An empty array is true: []

Meaning to check for a username length and 0 is true,
code will never be false.
=end
# bad
unless name.length
    warn "User name required"
end

# bad
if password.length < 8
    fail "Password too short"
end
unless username
    fail "No user name set"
end

# good: try inline if/unless
fail "Password too short" if password.length < 8
fail "No user name set" unless username

# SHORT-CIRCUIT - "AND"
# bad
if user
    if user.signed_in?
        #...
    end
end

# good: if user and user signed in. if nil, second half never runs
if user && user.signed_in?
    #...
end

# SHORT-CIRCUIT ASSIGNMENT
# nil or 1: false, returns 1
result = nil || 1
# 1 or nil: false, returns 1
result = 1 || nil
# nil or 2, false, returns 1
result = 1 || 2

# bad
tweets = timeline.tweets
tweets = [] unless tweets

# good: if nil, default to empty array
tweets = timeline.tweets || []

# SHORT-CIRCUIT EVALUATION
# check to see if current session, not evaluated unless
# -current session is nil.
# but consider whether if/else would be more legible.
def sign_in
    current_session || sign_user_in
end

# CONDITIONAL ASSIGNMENT
# refactor this bad code:
options[:country] = 'us' if options[:country].nil?
options[:privacy] = true if options[:privacy].nil?
options[:geotag] = true if options[:geotag].nil?

# good: use conditional assignment operator to set defaults
options[:country] ||= 'us'
options[:privacy] ||= true
options[:geotag]  ||= true

# CONDITIONAL RETURN VALUES
# bad
if list_name
    options[:path] = "/#{user_name}/#{list_name}"
else
    options[:path] = "/#{user_name}"
end

# good: use conditional return value.
# In Ruby, conditionals always return a value
# assign the value of the if statement:
# Move options path in front of the values, so that
# the values returned will get set to the options path
options[:path] = if list_name
    "/#{user_name}/#{list_name}"
else
    "/#{user_name}"
end

# bad
def list_url(user_name, list_name)
    if list_name
        url = "https://twitter.com/#{user_name}/#{lis}"
    else
        url = "https://twitter.com/#{user_name}"
    end
    url
end

# good: refactor to make more readable.
# get rid of url, because if statement will return value
# and that value will get returned by the method
# in this example, set client name returns a value(url)
client_url = case client_name
when "web"
    "http://twitter.com"
when "Facebook"
    "http://www.facebook.com/twitter"
else
    nil
end

#CASE - RANGES
# two other ways we can use case statements:
# first, by range
popularity = case tweet.retweet_count
    when 0..9
        nil
    when 10..99
        "trending"
    else
        "hot"
end

# use regex to see if tweet is trending or hot
tweet_type = case tweet.status
    when /\A@\w+/
        :mention
    when /\Ad\s+\w+/
        :direct_message
    else
        :public
end

# second, can write case statement with whens and thens:
tweet_type = case tweet.status
    when /\A@\w+/ then :mention
    when /\Ad\s+\w+/ then :direct_message
    else :public
end



=begin

=end


































