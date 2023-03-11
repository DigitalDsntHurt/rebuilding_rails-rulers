module Rulers
    class FilePaths
        class << self
            def path(file)
                File.dirname(file)
            end

            def public_html
                current_file_path = File.dirname(__FILE__)
                dirs = current_file_path.split('/')
                dirs.pop
                dirs.pop
                html_file = File.join(dirs.join('/'), 'public', 'index.html')
                File.read(html_file)
            end
        end
    end
end