
# файлы классов переместил в папку lib
require_relative "lib/test_body.rb"
require_relative "lib/result_printer.rb"

current_path = File.dirname(__FILE__)
questions_file_path = current_path + "/data/questions.txt"
answers_file_path = current_path + "/data/answers.txt"

user_name = ARGV[0]

if ARGV[0].nil?
  puts "Вы можете ввести свое имя следующим образом:"
  puts "В консоли ввести следующее \"ruby main.rb \"Ваше имя\"\""
end

if (Gem.win_platform? && ARGV[0])
  user_name = user_name.encode(ARGV[0].encoding).encode("UTF-8")
end



test_body = TestBody.new(user_name, questions_file_path)
# поменял название инициализации класса
result_printer = ResultPrinter.new(answers_file_path)

until test_body.finished? do
  result_printer.print_body(test_body)
  test_body.ask_next_question
end

result_printer.print_result(test_body)
