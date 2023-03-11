# p 'haaaa'
# p __FILE__
# p File.read('/Users/nick.smith/grapespace/skillsdev/rebuilding_rails/rebuilding_rails-rulers/public/index.html')
# p File.dirname(__FILE__)
# p File.read('/public/index.html')
# p File.join(File.expand_path('../'), 'public', 'index.html')
# p File.join(File.expand_path('/'), 'public', 'index.html')
# p File.join(File.expand_path('../..'), 'public', 'index.html')
# p File.read(File.join(File.expand_path('../'), 'public', 'index.html'))

#### #### #### ####

# current_file_path = File.dirname(__FILE__)
# p current_file_path
# dirs = current_file_path.split('/')
# dirs.pop
# html_file = File.join(dirs.join('/'), 'public', 'index.html')
# puts 
# p File.read(html_file)



require_relative 'rulers/file_paths'
p Rulers::FilePaths.public_html