require "csv"

Product.destroy_all
Category.destroy_all

csv_file = Rails.root.join("db/products.csv")
products = CSV.parse(File.read(csv_file), headers: true)

products.each do |row|
  category = Category.find_or_create_by!(name: row["category"])

  Product.create!(
    title: row["name"],
    description: row["description"],
    price: row["price"],
    stock_quantity: row["stock quantity"],
    category: category
  )
end

puts "Imported #{Product.count} products and #{Category.count} categories."