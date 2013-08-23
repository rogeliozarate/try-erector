require 'sinatra'
require 'sinatra/reloader' if development?
require 'erector'


class Hello < Erector::Widget
  def content
    html {
      head {
        title "Hello"
      }
      body {
        h1.heading! "Message:"
        text "Hello, "
        b.big @target
        text "!"
        p { 
          b Time.now }
      }
    }
  end
end


get '/' do
  Hello.new(:target => 'world').to_html
end
