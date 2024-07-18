# [Saicophonic Medicine](https://www.saicophonic.com "Saicophonic Medicine")
WebApp that helps build, share and manage a collection of live music videos and lyrics with custom timestamps (or digital dog-ears).

[View the Front End Repository](https://github.com/nataliagalan/saicophonic-medicine-frontend "Saicophonic Medicine Front End") 

## Features
- Built the ability to easily click on timestamps for a fast video playback experience.
- Simplified the process for adding timestamps to each video with an intuitive slider.
- Tuned search and discovery capabilities with Elasticsearch (used by Shopify, Github, LinkedIn...) and autocomplete.
- Decreased load time by 88.5% with lazy loading implementation.
- Delivered a fully responsive site with the ability to toggle smoothly between list and grid view.
- Optimized UX for adding lyrics through a drag and drop feature with keyboard accessibility and
dynamic forms (added the ability to seamlessly add or remove input fields dynamically). Utilized React Hooks and Redux store for scalability.
- Created a relational database system (PostgreSQL), and a Rails (RESTful) API backend with endpoints
for videos, tagged videos, random video, tags, and searched results.
- Utilized JSON Web Tokens and localStorage to store encrypted admin information on client-side.
Integrated bcrypt and further secured credential management by storing config in env variable on server-side.
- Styled using React-Bootstrap, Sass, and custom CSS3.

## Key User Stories
- Admin: 
  - Build and categorize an archive of videos with corresponding songs, lyrics and timestamps.
  - Click on a timestamps to play the video at a specific time.
  - View both lyrics and video simultaneously in either desktop or mobile devices.
  - Drag form input fields to custom order.
  - Add or remove custom number of input fields.
  - Add and delete video tags.
  - Add and delete videos.
  - Edit timestamps, song titles, lyrics, url and artist/band name.

- Visitor: 
  - Explore the full library.
  - Search videos by song title, artist or lyrics.
  - Explore videos by tag.
  - Get a random video.
  - Click on a button to share a specific video.
  
## Walkthrough
See a [video demo](https://vimeo.com/481551182/c203801a37 "Saicophonic Medicine Demo") of the app's functionality. 

## Contact

hi@nataliagalan.me | [Visit my LinkedIn](https://linkedin.com/in/natalia-galan "Natalia Galán LinkedIn") 

