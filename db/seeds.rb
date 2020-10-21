# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Song.destroy_all
Video.destroy_all
User.destroy_all


u1 = User.create(username: 'ursula')

v1 = Video.create(url: 'https://youtu.be/VEUe1J0c2k4', user_id: User.ids.sample)

v2 = Video.create(url: 'https://youtu.be/AuupPbyDs7s', user_id: User.ids.sample)

v3 = Video.create(url: 'https://youtu.be/3ALuST7XCGA', user_id: User.ids.sample)

s1 = Song.create(timestamp: 341, lyrics: 'test lyrics', title: 'test title', video_id: Video.ids.sample)
s2 = Song.create(timestamp: 538, lyrics: 'test lyrics2', title: 'test title2', video_id: Video.ids.sample)
