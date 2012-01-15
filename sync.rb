#!/usr/bin/env ruby

PROJECT_DIR = '/home/plzen/projects/'
REMOTE_DIR = '/home/plzen/ttt/'

file = ARGV[0]
newfile = file.sub(PROJECT_DIR, '')
dirs = newfile.split('/')

original_path = PROJECT_DIR + dirs[0]

puts "rsync -au --delete #{original_path} #{REMOTE_DIR}"
