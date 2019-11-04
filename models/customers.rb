require_relative('../db/sql_runner.rb')

class Customer

  attr_reader :id
  attr_accessor :first_name, :last_name, :funds

  def initialize(options)
    @id = options['id'] if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @funds = options['funds']
  end

  def save()  #Create
    sql = "INSERT INTO customers (first_name, last_name, funds) VALUES ($1, $2, $3) RETURNING id"
    values = [@first_name, @last_name, @funds]
    customer = SqlRunner.run(sql, values)[0]
    @id = customer['id'].to_i
  end

  def update() #Update
    sql = "UPDATE customers SET (first_name, last_name, funds)
    =
    ($1,$2,$3) WHERE id = $4"
    values = [@first_name, @last_name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets ON films.id = tickets.film_id WHERE customer_id = $1"
    values = [@id]
    films_list = SqlRunner.run(sql, values)
    return films_list.map{ |film| Film.new(film) }
  end


  def self.delete_all()
    sql = "DELETE FROM customers "
    SqlRunner.run(sql)
  end


end
