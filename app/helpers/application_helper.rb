module ApplicationHelper
  def ugly_lyrics(lyrics)
    lines = h(lyrics).split("\n")
    lines.map! { |line| "&#x2603 " + line }
    html = "<pre>#{lines.join("\n")}</pre>"

    html.html_safe
  end
end
