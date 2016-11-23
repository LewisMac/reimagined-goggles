require('pry-byebug')
require_relative('../db/sql_runner')

class Wizard

  attr_reader( :first_name, :last_name, :house_name, :age, :id )

  def initialize( options )
    @id = nil || options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house_name = options['house_name']
    @age = options['age'].to_i
  end

  def house_id_from_name()
    sql = "
    SELECT * FROM house
    WHERE house_name = '#{@house_name}'
    ;"
    house = SqlRunner.run(sql)
    house_id = house[0]['id']
    return house_id
  end

  def save
    house_id = house_id_from_name()
    sql = 
    "INSERT INTO students(first_name, last_name, age, house_id)
    VALUES ('#{@first_name}', '#{@last_name}', #{@age}, #{house_id}) returning *;"
    result = SqlRunner.run( sql ).first
    @id = result['id'].to_i
  end

  def self.delete( id )
    sql = "DELETE FROM students WHERE id=#{id}"
    SqlRunner.run( sql )
  end

  def self.delete_all()
    sql = "DELETE FROM students;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "
    SELECT s.*, h.house_name
    FROM students s
    INNER JOIN house h
    on s.house_id = h.id;"
    students = SqlRunner.run(sql)
    result = students.map {|lizard| Wizard.new(lizard)}
    return result
  end

  def self.find(wizard_id)
    sql = "
    SELECT s.*, h.house_name
    FROM students s
    INNER JOIN house h
    on s.house_id = h.id
    WHERE s.id = #{wizard_id};"
    students = SqlRunner.run(sql).first
    return Wizard.new(students)
  end



end
