class ResultPrinter

  def get_answers
    current_path = File.dirname(__FILE__)
    file_path = current_path + "/data/answers.txt"
    begin
      f = File.new(file_path, "r:UTF-8")
      lines = f.readlines
      f.close
    rescue SystemCallError => e
      puts "File #{file_path} was not found #{e}"
    end
    lines
  end

  def print_body(test_body)
    cls
    if test_body.user_name == nil
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

    if test_body.user_name == nil
      puts "\nГенацвали Таинственный незнакомец\n"
    else
      puts "\nГенацвали #{test_body.user_name.capitalize}\n"
    end

    if test_body.points % 10 == 1
      puts "\nВаш результат #{test_body.test_body.points} очко\n\r"
    elsif test_body.points % 10 > 1 && test_body.points % 10 <= 4 && test_body.points != 11 && test_body.points != 12 && test_body.points != 13
      puts "\nВаш результат #{test_body.points} очка\n\r"
    else
      puts "\nВаш результат #{test_body.points} очков\n\r"
    end

    if test_body.points >= 30
      puts get_answers[0]
    elsif test_body.points >= 25 && test_body.points <= 29
      puts get_answers[1]
    elsif test_body.points >= 19 && test_body.points <= 24
      puts get_answers[2]
    elsif test_body.points >= 14 && test_body.points <= 18
      puts get_answers[3]
    elsif test_body.points >= 9 && test_body.points <= 13
      puts get_answers[4]
    elsif test_body.points >= 4 && test_body.points <= 8
      puts get_answers[5]
    else
      puts get_answers[6]
    end
  end

  def cls
    system "clear" or system "cls"
  end
end
