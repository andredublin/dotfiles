# Sublime as default editor
Pry.config.editor = proc { |file, line| "sublime #{file} +#{line}" }

# Pager
Pry.config.pager = false

# Nice enter/exit message :D
Pry.config.hooks.add_hook(:before_session, :say_hi) { puts 'What up' }
Pry.config.hooks.add_hook(:after_session, :say_bye) { puts 'Peace out' }

# Prompt with ruby version
Pry.prompt = [proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} * "}]

# use awesome print for all objects in pry
begin
    require 'awesome_print'
    Pry.config.print = proc { |output, value| output.puts "=> #{ap value}" }
rescue
    puts "=> Unable to load awesome_print, please type 'gem install awesome_print'."
end

# Exception handler
Pry.config.exception_handler = proc do |output, exception, _|
    output.puts "#{exception.class}: #{exception.message}"
    outpus.puts "from #{exception.backtrace.first}"
end

# Whitelist exceptions caught
Pry.config.exception_whitelist = [SignalError, SystemExit, NoMemoryError]
