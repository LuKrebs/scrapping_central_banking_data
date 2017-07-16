class View

  def show_number_of_rows(rows)
    puts "O número total de servidores do Banco Central do Brasil é:"
    puts "#{rows[0][0]}"
  end

  def show_sum_salaries(total_value)
    x = total_value[0][0].to_s.delete(".")
    puts "A soma total de servidores do Banco Central do Brasil é:"
    puts "R$ #{x[0,2]}.#{x[2,3]}.#{x[5,3]},00"
  end

  def show_avg(avg)
    puts "A média salarial dos servidores do Banco Central do Brasil é:"
    x = avg[0][0].to_s.delete(".")
    puts "R$ #{x[0, 2]}.#{x[2, 3]},#{x[5, 2]}"
  end

  def show_all(all)
    all.each do |servidor|
      puts "#{servidor.id}. #{servidor.name} ~> R$ #{servidor.salary}"
    end
  end

  def get_fist_letter
    puts "Por favor, entre a inicial do nome do servidor: "
    gets.chomp
  end

  def show_user(user_by_id)
    show_all(user_by_id)
  end

  def get_id
    puts "Por favor, entre o ID do servidor:"
    gets.chomp.to_i
  end

  def show_user(user_by_id)
    puts "#{user_by_id.id}. #{user_by_id.name} ~> R$ #{user_by_id.salary}"
  end
end
