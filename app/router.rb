class Router
  def initialize
    @controller = ServiceController.new
    @running    = true
  end

  def run
    print_welcome
    while @running
      print_menu
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @controller.total_rows
    when 2 then @controller.total_sum
    when 3 then @controller.avg_salary
    when 4 then @controller.show_all
    when 5 then @controller.show_all_initial_letter
    when 6 then @controller.search_by_id
    when 7 then stop
    else
      puts "Please press 1, 2, 3, 4, 5, 6 ou 7"
    end
  end

  def stop
    @running = false
  end

  def actions
    [
      "Descubra o número de servidores",
      "Descubra o valor de todos os salários somados",
      "Descubra a Média Salarial",
      "Listar todos os nomes e salários",
      "Listar nomes pela letra inicial do nome",
      "Procurar servidor pelo ID",
      "Sair do programa"
    ]
  end

  def print_menu
    puts "\n--\nO que mais você deseja ver?"
    actions.each_with_index do |action, index|
      puts "#{index + 1} - #{action}"
    end
    print "> "
  end

  def print_welcome
    puts "-----------------------------"
    puts "Bem vindo ao contador de salário dos servidores públicos do Banco Central!"
    puts "-----------------------------"
  end
end
