# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Create admin user
admin = User.find_or_create_by!(username: "admin") do |u|
  u.email = "admin@example.com"
  u.password = "admin"
  u.password_confirmation = "admin"
  u.admin = true
end

puts "Admin user: #{admin.username} / admin"

# Sample blog posts
posts = [
  {
    title: "Hello, World!",
    body: "Welcome to my blog! This is the very first post. I'm excited to share my thoughts and ideas with you here.\n\nThis blog is built with Ruby on Rails and styled with Tailwind CSS. It uses MySQL as the database backend.\n\nStay tuned for more posts!",
    published_at: 3.days.ago
  },
  {
    title: "Getting Started with Ruby on Rails",
    body: "Ruby on Rails is a fantastic web framework that makes building web applications fast and enjoyable.\n\nSome of the core principles of Rails:\n- Convention over Configuration\n- Don't Repeat Yourself (DRY)\n- Rapid development with scaffolding\n\nIn this post we'll explore why Rails remains one of the most productive web frameworks available today.",
    published_at: 1.day.ago
  },
  {
    title: "Why Tailwind CSS?",
    body: "Tailwind CSS is a utility-first CSS framework that allows you to build custom designs without leaving your HTML.\n\nInstead of writing custom CSS, you compose designs using pre-built utility classes. This approach leads to:\n- Faster development\n- Consistent styling\n- Smaller CSS bundle sizes in production\n\nCombined with Rails, Tailwind CSS makes building beautiful web apps a breeze.",
    published_at: Time.current
  }
]

posts.each do |attrs|
  Post.find_or_create_by!(title: attrs[:title]) do |post|
    post.body = attrs[:body]
    post.published_at = attrs[:published_at]
    post.user = admin
  end
end

puts "Created #{Post.count} posts."
