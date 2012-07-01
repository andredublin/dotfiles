# Vim as default editor
Pry.config.editor = 'vim'

# Pager
Pry.config.pager = false

# Nice exit message :D
Pry.hooks = { :after_session => proc { puts 'bye-bye' } }

# Prompt with ruby version
Pry.prompt = [proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} * "}]
