require "lib/inline_image"

SMALL_PNG_DATA_URI = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAMAAADz0U65AAAAw1BMVEWooJK5rJTTxKqxp5RrVVNuTE6ngG+skoeFjHatqYnEsJagk4GBWVOwfGfRoX/Mq492Z150XVSwloiScmqyfGrXpYa+jHCme2ulg3bJqZjEn4yneGmMVUyeZ1ibYVO6kYDOt57SrZfKoYyWZVtcKS6pbVurZlW3h3i5mIDEmoKudWZpOztpUD+QZVF8OTGQVUlsQj9VIyFOICdbQy6jpFZyajY1BgtmOj15Y2ZCJTNFKTljT0KLhFF5cklVNjd/YWb///+DUmMKAAAAAWJLR0RA/tlc2AAAAAlwSFlzAAAASAAAAEgARslrPgAAABJJREFUCNdjZGCEAg4ozUIWAwATLwCLd45LKgAAAABJRU5ErkJggg=="

SMALL_PNG_IN_CSS_BEFORE = <<-END_CSS
.with-small {
background: white url(images/small.png) no-repeat center;
}
END_CSS

SMALL_PNG_IN_CSS_AFTER = <<-END_CSS
.with-small {
background: white url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAMAAADz0U65AAAAw1BMVEWooJK5rJTTxKqxp5RrVVNuTE6ngG+skoeFjHatqYnEsJagk4GBWVOwfGfRoX/Mq492Z150XVSwloiScmqyfGrXpYa+jHCme2ulg3bJqZjEn4yneGmMVUyeZ1ibYVO6kYDOt57SrZfKoYyWZVtcKS6pbVurZlW3h3i5mIDEmoKudWZpOztpUD+QZVF8OTGQVUlsQj9VIyFOICdbQy6jpFZyajY1BgtmOj15Y2ZCJTNFKTljT0KLhFF5cklVNjd/YWb///+DUmMKAAAAAWJLR0RA/tlc2AAAAAlwSFlzAAAASAAAAEgARslrPgAAABJJREFUCNdjZGCEAg4ozUIWAwATLwCLd45LKgAAAABJRU5ErkJggg==) no-repeat center;
}
END_CSS

LARGE_PNG_IN_CSS = <<-END_CSS
.with-large {
background: white url(images/large.png)
}
END_CSS

SMALL_PNG_IN_HTML_BEFORE = <<-END_HTML
<img src="images/small.png" />
END_HTML

SMALL_PNG_IN_HTML_AFTER = <<-END_HTML
<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAMAAADz0U65AAAAw1BMVEWooJK5rJTTxKqxp5RrVVNuTE6ngG+skoeFjHatqYnEsJagk4GBWVOwfGfRoX/Mq492Z150XVSwloiScmqyfGrXpYa+jHCme2ulg3bJqZjEn4yneGmMVUyeZ1ibYVO6kYDOt57SrZfKoYyWZVtcKS6pbVurZlW3h3i5mIDEmoKudWZpOztpUD+QZVF8OTGQVUlsQj9VIyFOICdbQy6jpFZyajY1BgtmOj15Y2ZCJTNFKTljT0KLhFF5cklVNjd/YWb///+DUmMKAAAAAWJLR0RA/tlc2AAAAAlwSFlzAAAASAAAAEgARslrPgAAABJJREFUCNdjZGCEAg4ozUIWAwATLwCLd45LKgAAAABJRU5ErkJggg==" />
END_HTML

LARGE_PNG_IN_HTML = <<-END_HTML
<img src="images/large.png" />
END_HTML

describe InlineImage do
  it "encodes small images" do
    InlineImage.process("spec/fixtures", "images/small.png").should eq(SMALL_PNG_DATA_URI)
  end

  it "change default max size and encodes small images" do
    InlineImage.process("spec/fixtures", "images/small.png", 1025).should eq(SMALL_PNG_DATA_URI)
  end

  it "does not modify large image" do
    InlineImage.process("spec/fixtures", "images/large.png").should eq("images/large.png")
  end

  context "when processing css" do
    it "replace small images in css" do
      InlineImage.replace_in_css(SMALL_PNG_IN_CSS_BEFORE, "spec/fixtures").should eq(SMALL_PNG_IN_CSS_AFTER)
    end

    it "modify max size and replace small images in css" do
      InlineImage.replace_in_css(SMALL_PNG_IN_CSS_BEFORE, "spec/fixtures", 1025).should eq(SMALL_PNG_IN_CSS_AFTER)
    end

    it "does not modify large image in css" do
      InlineImage.replace_in_css(LARGE_PNG_IN_CSS, "spec/fixtures").should eq(LARGE_PNG_IN_CSS)
    end

    it "modify max size and does not modify large image in css" do
      InlineImage.replace_in_css(LARGE_PNG_IN_CSS, "spec/fixtures", 1025).should eq(LARGE_PNG_IN_CSS)
    end
  end

  context "when processing html" do
    it "replace small images in html" do
      InlineImage.replace_in_html(SMALL_PNG_IN_HTML_BEFORE, "spec/fixtures").should eq(SMALL_PNG_IN_HTML_AFTER)
    end

    it "does not modify large image in html" do
      InlineImage.replace_in_html(LARGE_PNG_IN_HTML, "spec/fixtures").should eq(LARGE_PNG_IN_HTML)
    end

    it "modify max size and replace small images in html" do
      InlineImage.replace_in_html(SMALL_PNG_IN_HTML_BEFORE, "spec/fixtures", 1025).should eq(SMALL_PNG_IN_HTML_AFTER)
    end

    it "modify max size and does not modify large image in html" do
      InlineImage.replace_in_html(LARGE_PNG_IN_HTML, "spec/fixtures", 1025).should eq(LARGE_PNG_IN_HTML)
    end
  end
end
