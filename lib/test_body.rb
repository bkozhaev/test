class TestBody
  #1. Сократил написание сеттеров
  attr_reader :user_name, :points

  def initialize(user_name, file_path)
    @user_name = user_name
    @points = 0
    @count = 0
    #2. Вывел ссылку на файл в main.rb а сам метод привязал к (file_path)
    #3. Изменил чтение строки с файла одной строкой
    begin
      @lines = File.readlines(file_path, encoding: 'UTF-8')
    rescue SystemCallError => e
      puts "Файл #{file_path} был не найден #{e}"
    end
  end

  def finished?
    @count >= @lines.size
  end

  # создал отдельный метод по подсчету очкое,
  # вывел действие по подсчету очков с метода ask_next_question
  def get_user_points (user_input)
    case user_input
      when 1 then @points += 2
      when 3 then @points += 1
    end
  end

  # создал метод для вывода вопроса отдельно от метода ask_next_question
  def print_question
    puts "\nВопрос №#{@count + 1}\n\r"
    puts @lines[@count]
  end

  def ask_next_question
    print_question

    user_input = nil
    while user_input != 1 && user_input != 2 && user_input != 3
      puts <<~STR

        Нажмите:
        "1 - Enter" Если ваш ответ "да"
        "2 - Enter" Если ваш ответ "нет"
        "3 - Enter" Если ваш ответ "иногда"

      STR
      user_input = STDIN.gets.to_i
    end
    get_user_points(user_input)
    @count += 1
  end
end

