# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Bodypart.create(name: "Head") if Bodypart.where(name: "Head").blank?
Bodypart.create(name: "Neck") if Bodypart.where(name: "Neck").blank?
Bodypart.create(name: "Torso") if Bodypart.where(name: "Torso").blank?
Bodypart.create(name: "Upper limbs") if Bodypart.where(name: "Upper limbs").blank?
Bodypart.create(name: "Lower limbs") if Bodypart.where(name: "Lower limbs").blank?
Bodypart.create(name: "Cavities") if Bodypart.where(name: "Cavities").blank?
Post.all.each do |p|
  p.bodypart = Bodypart.first
  p.pain_level = 4 if p.pain_level.nil?
  p.id.nil? ? p.destroy : p.save
end


Description.find_or_create_by(name: 'burning')
Description.find_or_create_by(name: 'chronic')
Description.find_or_create_by(name: 'sharp')
Description.find_or_create_by(name: 'stabbing')


Post.create(
    time: Time.now,
    #time: Post.created_at
    title: 'Test Post',
    body: 'This is a test post.',
    pain_level: 7,
    bodypart_id: 1,
    description_ids: [1,2]
  ) if Post.where(title: 'Test Post').blank?
