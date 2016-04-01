module ApplicationHelper
  def ugly_lyrics(lyrics)
    lines = lyrics.split("\n")

    html = "<pre>"
    lines.each do |line|
      html += "&#x2603 " + h(line)
    end
    html += "</pre>"

    html.html_safe
  end
end
