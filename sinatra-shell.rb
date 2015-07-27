#!/usr/bin/ruby
require "fileutils"

puts "sinatra-shell"
print "Enter a name for your app: "
name = gets.chomp
path_name = name.gsub(" ", "_")
target_dir_str = File.join(Dir.pwd, path_name)
if not Dir.exist?(target_dir_str)
  print "Create #{target_dir_str}? (y/n) "
  result = gets.chomp
  if result[0].downcase == "y"
    Dir.mkdir(target_dir_str)
  else
    print "Cannot continue..."
    exit
  end
else
  print "#{target_dir_str} already exists... sinatra-shell creates the directory for you. You do not need to make one."
  exit
end
target_dir = Dir.new(target_dir_str)
old_path = File.join(File.dirname(__FILE__), "sinatra-shell-files")
FileUtils.copy_entry(old_path, target_dir)

ignore = File.new(File.join(target_dir_str,  ".gitignore"),  "w+")
ignore.write(".bundle/")
ignore.close

puts "Copied files, running 'bundle install' (this might take a bit, please be patient)..."
puts `cd #{target_dir_str} && bundle install`

puts
puts

puts "Done! Change directory to #{target_dir_str} to see your new app."