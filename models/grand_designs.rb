require('pry-byebug')
require_relative('../db/sql_runner')

class House

  attr_reader( :house_name,:id )

  def initialize( options )
    @id = nil || options['id'].to_i
    @house_name = options['house_name']   
  end

  def save
    sql = 
    "INSERT INTO house(house_name)
    VALUES ('#{@house_name}') returning *;"
    result = SqlRunner.run( sql ).first
    @id = result['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM house;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM house;"
    house = SqlRunner.run(sql)
    result = house.map {|lizard| House.new(lizard)}
    return result
  end

  def self.find(house_id)
    sql = "SELECT * FROM house WHERE id = #{house_id};" 
    house = SqlRunner.run(sql).first
    return House.new(house)
  end

end
