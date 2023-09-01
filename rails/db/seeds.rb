Article.find_or_create_by!(title: "Swift for Ruby developers") do |article|
  article.body = %(
    In Ruby, any variable could potentially be nil.
    In Swift, variables must be explicitly declared as optional.
  ).squish
end

Article.find_or_create_by!(title: "Turbo Native tabs") do |article|
  article.body = %(
    This row of buttons along the bottom of an iOS app is a common UX pattern.
    And it makes the app feel more native.
    Take, for example, the built in Clock app.
  ).squish
end
