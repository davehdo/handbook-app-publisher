# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
3.times do |n|
    mod = Folder.create(title: "Module #{n}")
    3.times do |m|
        fold = mod.subfolders.create(title: "Folder #{m}")
        3.times do |o|
           doc = fold.docs.create(title: "Document #{o}") 
           3.times do |p|
              doc.sections.create(title: "Section #{p}", content: "Lots of great content") 
           end
        end
    end
end