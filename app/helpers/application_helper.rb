module ApplicationHelper
  def ugly_lyrics(lyrics)
    lines = h(lyrics).split("\n")
    lines.map! { |line| "&#x2603 " + line }
    html = "<pre>#{lines.join("\n")}</pre>"

    html.html_safe
  end

  def display_errors(object)
    messages = object.errors.full_messages
    html = ""

    unless messages.empty?
      html += "<ul>"
      messages.map! { |message| "<li>" + h(message) + "</li>" }
      html += messages.join
      html += "</ul>"
    end

    html.html_safe
  end
end
