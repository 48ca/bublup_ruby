require_relative 'formatter'
format = Formatter.new
format.string = "Hello, my name is James."
puts format.render("html",format.split)
puts format.render("asterisk",format.split)
