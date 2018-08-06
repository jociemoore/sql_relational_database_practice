require "sequel"
require "pg"
DB = Sequel.connect('postgres://localhost/sequel-single-table')

WAGE = 12.00
MIN_PER_HOUR = 60.00

menu = DB[:menu_items]
menu_stats = menu.all
profit = menu.select {[
    item, 
    Sequel.as(menu_price - ingredient_cost - ((prep_time/MIN_PER_HOUR) * WAGE).cast(:float), :profit)
]}.all
labor = menu.select {[
  item, 
  Sequel.as(((prep_time/60.00) * 12.00).cast(:float), :labor)
]}.all

def format_money(amount)
  sprintf('%0.2f', amount)
end

menu_stats.each_with_index do |row, index|
  puts row[:item]
  puts "menu price: $#{row[:menu_price].to_f}"
  puts "ingredient cost: $#{format_money(row[:ingredient_cost].to_f)}"
  puts "labor: #{format_money(labor[index][:labor])}"
  puts "profit: $#{profit[index][:profit]}"  
  puts
end

