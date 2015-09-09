#!/usr/bin/env ruby
# This is a mostly procedural installation script for talkode.
# See the readme for details.

OSX_COLORS = "#{ENV['HOME']}/Library/Colors"

TALKODE_FILES = {
  style:      "presentation.py",
  colorize:   "colorize.sh",
  extract:    "extract.sh",
  keynote:    "Programming.clr"
}

TALKODE_PATH = "#{ENV['HOME']}/.talkode"

def style_dir
  python_path = `which python`
  raise "You must have python installed" unless python_path
  path_regex = /\A(?<find_path>\/[^\/]+\/[^\/]+)/
  find_path = python_path.match(path_regex)[:find_path]
  style_dir = `find #{find_path} -type d -ipath '*pygments/styles*' -print`
  raise "Could not find pygments style directory. Have you installed pygments?" unless style_dir
  style_dir.chomp
end

def make_dirs
  unless File.exists?(TALKODE_PATH)
    puts "Making #{TALKODE_PATH}"
    puts `mkdir -p #{TALKODE_PATH}`
  end

  unless File.exists?(OSX_COLORS)
    puts "Making #{OSX_COLORS}"
    `mkdir -p #{OSX_COLORS}`
  end
end

def copy_talkode_files
  TALKODE_FILES.values.each do |file|
    puts "Copying #{file} to #{TALKODE_PATH}"
    puts `cp #{file} #{TALKODE_PATH}/`
  end
end

def link_styles(style_dir)
  puts "Linking #{TALKODE_FILES[:style]}"
  `ln -s #{TALKODE_PATH}/#{TALKODE_FILES[:style]} #{style_dir}/`

  puts "Linking #{OSX_COLORS}"
  `ln -s #{TALKODE_PATH}/#{TALKODE_FILES[:keynote]} #{OSX_COLORS}/`
end

make_dirs
copy_talkode_files
link_styles(style_dir)
