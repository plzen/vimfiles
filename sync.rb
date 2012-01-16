#!/home/nvoronin/.rvm/rubies/ruby-1.8.7-p352/bin/ruby

PROJECT_DIR = '/home/nvoronin/projects/'
REMOTE_DIR = '/home/nvoronin/test/'

file = ARGV[0]

if file.include? PROJECT_DIR
    newfile = file.sub(PROJECT_DIR, '')
    dirs = newfile.split('/')

    original_path = PROJECT_DIR + dirs[0]

    exec "rsync -au --delete --exclude '.svn' --exclude '.hg' --exclude '.git' #{original_path} #{REMOTE_DIR}" if fork.nil?
end
