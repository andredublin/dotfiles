# Vim as default editor
Pry.config.editor = 'vim'

# Pager
Pry.config.pager = false

# Nice enter/exit message :D
Pry.config.hooks.add_hook(:before_session, :say_hi) do
   puts 'What up'
end
Pry.config.hooks.add_hook(:after_session, :say_bye) do
   puts 'Peace out'
end

# Prompt with ruby version
Pry.prompt = [proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} * "}]
