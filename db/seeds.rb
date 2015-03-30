# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Bodypart.create(name: "upper body") if Bodypart.where(name: "upper body").blank?
Bodypart.create(name: "lower body") if Bodypart.where(name: "lower body").blank?
Post.all.each do |p|
  p.bodypart = Bodypart.first
  p.pain_level = 4 if p.pain_level.nil?
  p.id.nil? ? p.destroy : p.save
end


Description.find_or_create_by(name: 'sharp')
Description.find_or_create_by(name: 'test')
Description.find_or_create_by(name: 'test2')
Description.find_or_create_by(name: 'test3')

Post.create(
    title: 'test1',
    body: 'once upon a time, there was little girl...',
    pain_level: 7,
    description_ids: [1,2]
  ) if Post.where(title: 'test1').blank?
