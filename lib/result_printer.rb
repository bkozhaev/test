class ResultPrinter
  #вывел метод для считывания файла ответов в initialize
  def initialize(file_path)
    begin
      @answers = File.readlines(file_path, encoding: 'UTF-8')
    rescue SystemCallError => e
      puts "File #{file_path} was not found #{e}"
    end
  end

  # отдельный метод для проверки, введено ли имя
  def user_name_exists?(user_name)
    user_name == nil
  end

  # отдельный метод для проверки склонения и вывода результата
  def check_sklonenie(number)
    if number % 10 == 1
      puts "\nВаш результат #{number} очко\n\r"
    elsif number % 10 > 1 && number % 10 <= 4 && number != 11 && number != 12 && number != 13
      puts "\nВаш результат #{number} очка\n\r"
    else
      puts "\nВаш результат #{number} очков\n\r"
    end
  end

  # отдельный меод для вывода ответа от набраных очков
  def check_points(points)
    case points
      when 30..100 then puts @answers[0]
      when 25..29 then puts @answers[1]
      when 19..24 then puts @answers[2]
      when 14..18 then puts @answers[3]
      when 9..13 then puts @answers[4]
      when 4..8 then puts @answers[5]
      else puts @answers[6]
    end
  end

  def print_body(test_body)
    cls
    if user_name_exists?(test_body.user_name)
      puts <<~STR

        Добрый день, генацвали Таинственный незнакомец, для того чтобы узнать свой
        уровень коммуникабельности пройдите тест и ответь не следующие
        вопросы.
      STR
    else
      puts <<~STR

       Добрый день, генацвали #{test_body.user_name.capitalize}, для того чтобы узнать свой
       уровень коммуникабельности пройдите тест и ответь не следующие
       вопросы.
      STR
    end
  end

  def print_result(test_body)
    cls
    if user_name_exists?(test_body.user_name)
      puts "\nГенацвали Таинственный незнакомец\n"
    else
      puts "\nГенацвали #{test_body.user_name.capitalize}\n"
    end

    check_sklonenie(test_body.points)

    check_points(test_body.points)
  end

  def cls
    system "clear" or system "cls"
  end
end
