password = '123456'

%w[admin user].each { |u| User.create(email: "#{u}@example.com",
                                      password: password,
                                      password_confirmation: password) }
User.first.toggle!(:is_admin)

10.times { Category.create(name: Faker::Commerce.department(5).capitalize) }
categories = Category.all.to_a
3.times { categories.pop.update(parent: categories.shift) }
categories.first.update(parent: Category.first)
categories.last.update(parent: Category.last)

5.times { Item.create(name: Faker::Commerce.product_name.capitalize,
                      price: rand(100_000..1_000_000),
                      description: Faker::Lorem.paragraph,
                      category_id: rand(1..10)) }
