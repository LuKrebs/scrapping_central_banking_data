require 'pry-byebug'
require_relative '../models/service.rb'

class ServiceController

  def initialize
    @view = View.new
  end

  def total_rows
    rows = Service.number_of_rows
    @view.show_number_of_rows(rows)
  end

  def total_sum
    total_value = Service.sum_of_all_salaries
    @view.show_sum_salaries(total_value)
  end

  def avg_salary
    avg = Service.get_average
    @view.show_avg(avg)
  end

  def show_all
    all = Service.all
    @view.show_all(all)
  end

  def show_all_initial_letter
    first_letter = @view.get_fist_letter
    result = Service.find_by_first_letter(first_letter.upcase)
    binding.pry
    @view.show_all(result)
  end

  def search_by_id
    id = @view.get_id
    user_by_id = Service.find(id)
    binding.pry
    @view.show_user(user_by_id)
  end
end
