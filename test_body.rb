class TestBody
  def initialize(user_name)
    @name = user_name
    @points = 0
    @count = 0
  end

  def set_lines
    current_path = File.dirname(__FILE__)
    file_path = current_path + "/data/questions.txt"
    lines = nil

    begin
      f = File.new(file_path,"r:UTF-8")
      lines = f.readlines
      f.close
    rescue SystemCallError => e
      puts "File #{file_path} was not found #{e}"
    end
    lines
  end

  def finished?
    @count >= set_lines.size
  end

  def ask_next_question
    puts "\nВопрос №#{@count + 1}\n\r"
    puts set_lines[@count]
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

    case user_input
      when 1 then @points += 2
      when 3 then @points += 1
      else
        @points
    end

    @count += 1
  end

  def user_name
    @name
  end

  def points
    @points
  end
end

