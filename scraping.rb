require 'open-uri'
require 'nokogiri'
require 'sqlite3'
require 'pry-byebug'

dir = File.dirname(__FILE__)
DB = SQLite3::Database.new(File.join(dir, "db/public_service.sqlite"))

servidores = []
servidores_sem_salário = []
(1..262).each do |page|
	url = "http://www.portaltransparencia.gov.br/servidores/OrgaoExercicio-ListaServidores.asp?CodOrg=25201&Pagina=#{page}"
	raw_html = open(url).read
	html = Nokogiri::HTML(raw_html)

	html.search("#listagem table td:nth-child(2) a").each do |servidor|
		name = servidor.text.strip
		path = servidor.attr("href")
		url = "http://www.portaltransparencia.gov.br/servidores/#{path}"

		raw_html = open(url).read
		html = Nokogiri::HTML(raw_html)

		link_da_remuneracao = html.search("#resumo a")[0]
		path = link_da_remuneracao.attr("href")

		url = "http://www.portaltransparencia.gov.br#{path}"
		raw_html = open(url).read
		html = Nokogiri::HTML(raw_html)

		salário = html.search(".remuneracaolinhatotalliquida .colunaValor")[0]

		print "="

		if salário
			servidores << { name: name, salary: salário.text }
		  DB.execute('INSERT INTO servidores (name, salary) VALUES (?,?)', name, salário.text)
    else
			servidores_sem_salário << name
		end
	end
end

puts
puts "Servidores:"
servidores.each do |servidor|
	puts "#{servidor[:name]} - #{servidor[:salary]}"
end

puts
puts "Servidores sem salário:"
puts servidores_sem_salário
