class Service
  attr_reader :id
  attr_accessor :name, :salary

  def initialize(options = {})
    @id = options[:id]
    @name = options[:name]
    @salary = options[:salary]
  end

  def self.find(id)
    DB.results_as_hash = true

    result = DB.execute("SELECT *
                         FROM servidores
                         WHERE id = ?", id).first

    Service.new(id: result['id'], name: result['name'], salary: result['salary']) unless result.nil?
  end

  def self.all
    result = []
    DB.results_as_hash = true

    rows = DB.execute("SELECT * FROM servidores")

    rows.each do |row|
      result << Service.new(id: row['id'], name: row['name'], salary: row['salary'])
    end
    result
  end

  def self.number_of_rows
    DB.execute("SELECT COUNT(*) FROM servidores")
  end

  def self.sum_of_all_salaries
    DB.execute("SELECT SUM(salary) FROM servidores")
  end

  def self.get_average
    DB.execute("SELECT AVG(salary) FROM servidores")
  end

  def self.find_by_first_letter(first_letter)
    result = []
    DB.results_as_hash = true
    rows = DB.execute("SELECT *
                FROM servidores
                WHERE name LIKE '#{first_letter}%'")

    rows.each do |row|
      result << Service.new(id: row['id'], name: row['name'], salary: row['salary'])
    end
    result
  end
end



