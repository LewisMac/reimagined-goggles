require_relative('models/wizard_maker')
require_relative('models/grand_designs')

require('pry-byebug')

Wizard.delete_all
House.delete_all

house1 = House.new({
  'house_name' => 'Gryffindor'
  })
house2 = House.new({
  'house_name' => 'Hufflepuff'
  })
house3 = House.new({
  'house_name' => 'Slytherin'
  })
house4 = House.new({
  'house_name' => 'Ravenclaw'
  })

house1.save
house2.save
house3.save
house4.save

wizard1 = Wizard.new({
  'first_name' => 'Gandalf',
  'last_name' => 'the Grey',
  'age' => 24,
  'house_name' => 'Gryffindor'
  })

wizard1.save

wizard2 = Wizard.new({
 'first_name' => 'Elphaba',
 'last_name' => 'Of the West',
 'age' => 100,
 'house_name' => 'Slytherin'
  })

wizard2.save()



binding.pry
nil
