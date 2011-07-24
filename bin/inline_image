#!/usr/bin/env ruby
require "rubygems"
require "thor"
require "inline_image"

class InlineImg < Thor
  desc "inline FILENAME", "Inline images contained in FILENAME. FILENAME must be a css or html file. Extension is used to determine if it is either a css or a html file"
  method_option :size, :type => :numeric, :aliases => '-s', :default => 1024, :desc => "max size (in bytes) for an image file to be processed"
  def inline(filename) 
    return false unless File.exist? filename

    FileUtils.cp filename, "#{filename}.bak"

    dir = File.dirname(filename)
    extension = filename.split('.').last

    File.open(filename, File::RDWR) do |file|
      content = if extension == "css" then 
                  InlineImage.replace_in_css file.read, dir, options[:size]
                else 
                  InlineImage.replace_in_html file.read, dir, options[:size]
                end
      file.rewind
      file.truncate(0)
      file.write content
    end

  end

end

InlineImg.start
