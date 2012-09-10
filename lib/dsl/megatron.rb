module Common::DSL
  module Megatron
    require 'mechanize'
    
    # highline-esque
    def ask(prompt='',options={:secure=>false},&blk)
      printf prompt
      if options[:secure]
        require 'io/console'
        value = STDIN.noecho(&:gets)
      else
        value = gets.chomp
      end

      if not blk.nil?
        return (blk.call(value)) ? value : ask(prompt,blk)
      else
        value
      end
    end

    def tweet
      username, password = nil, nil
      ask "Username: " do |val|
        username = val
      end
      ask "Password: ", :secure => true do |val|
        password = val
      end
      #puts "\nUsername: #{username} Password: #{password}"

      # mechanize
      agent = Mechanize.new
      page = agent.get("https://www.twitter.com/login")
      login_form = page.form_with(:action=>'https://twitter.com/sessions')
      login_form['session[username_or_email]'] = username
      login_form['session[password]'] = password
      submitted_page = agent.submit(login_form)
      puts "\n"
      #puts submitted_page.class
      return submitted_page
      if !submitted_page.nil?
        # handle the tweet
        printf "Status: "
        tweet = gets.chomp[0..139] # 140 char max
        # post the tweet
        agent.post('https://api.twitter.com/1/statuses/update.json',
                   [
                     ["status",tweet],
                     ["trim_user","true"],
                     ["include_entities","true"]
                    ])
      end
    end
  end
end
