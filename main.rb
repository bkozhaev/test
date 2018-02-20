require_relative "test_body.rb"
require_relative "result_printer.rb"

# XXX/ Этот код необходим только при использовании русских букв на Windows
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
# /XXX

user_name = ARGV[0]

if ARGV[0].nil?
  puts "Вы можете ввести свое имя следующим образом:"
  puts "В консоли ввести следующее \"ruby main.rb \"Ваше имя\"\""
end

if (Gem.win_platform? && ARGV[0])
  user_name = user_name.encode(ARGV[0].encoding).encode("UTF-8")
end

test_body = TestBody.new(user_name)
printer = ResultPrinter.new

until test_body.finished? do
  printer.print_body(test_body)
  test_body.ask_next_question
end

printer.print_result(test_body)
