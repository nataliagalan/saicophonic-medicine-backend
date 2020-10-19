# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Video.destroy_all
User.destroy_all

u1 = User.create(username: 'ursula')

v1 = Video.create(url: 'https://youtu.be/VEUe1J0c2k4', lyrics: 'cant you bear just one more night?', user_id: User.ids.sample)

v2 = Video.create(url: 'https://youtu.be/AuupPbyDs7s', lyrics: 'bam bam', user_id: User.ids.sample)

v3 = Video.create(url: 'https://youtu.be/3ALuST7XCGA', lyrics: 'widowspeak plus', user_id: User.ids.sample)

