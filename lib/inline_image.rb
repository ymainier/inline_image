require "inline_image/version"
require "base64"
require "fileutils"

module InlineImage
  # Maximum file size to be inlined in bytes
  MAX_FILE_SIZE = 1024

  def in_css(filename, max_file_size = MAX_FILE_SIZE, options = {})
    return false unless File.exist? filename

    # TODO : Option to disable the copy
    FileUtils.cp filename, "#{filename}.bak"

    dir = File.dirname(filename)
    extension = filename.split('.').last

    File.open(filename, File::RDWR) do |file|
      css = replace_in_css file.read, dir

      file.rewind
      file.truncate(0)
      file.write css
    end

  end

  def self.replace_in_css(css_text, base_dir = '.', max_file_size = MAX_FILE_SIZE)
    css_text.gsub(/url\(['"]?([^'"\)]+)['"]?\)/m) do |match| 
      "url(#{process(base_dir, $1, max_file_size)})"
    end
  end

  def self.replace_in_html(html_text, base_dir = '.', max_file_size = MAX_FILE_SIZE)
    html_text.gsub(/src=['"]([^'"\)]+)['"]/m) do |match| 
      "src=\"#{process(base_dir, $1, max_file_size)}\""
    end
  end

  def self.process(base_dir, name_in_file, max_file_size = MAX_FILE_SIZE)
    image_filename = "#{base_dir}/#{name_in_file}"
    extension = name_in_file.split('.').last
    if File.size(image_filename) <= max_file_size then
      File.open(image_filename) do |img|
        base64encoded = Base64.encode64(img.read).gsub("\n", "")
        "data:image/#{extension};base64,#{base64encoded}"
      end if File.exist? image_filename
    else
      name_in_file
    end
  end
end
