# Saicophonic Medicine
A portable music venue and archive, showcasing an expanding library of live music sessions and lyrics with custom timestamps (or digital dog-ears).

[View the Front End Repository](https://github.com/nataliagalan/saicophonic-medicine-frontend "Saicophonic Medicine Front End") 

## Key User Stories
- Admin: 
  - Build and categorize an archive of videos with corresponding songs, lyrics and timestamps.
  - Click on a timestamps to play the video at a specific time.
  - View both lyrics and video simultaneously in desktop or mobile devices.
  - Drag form input fields to custom order.
  - Add or remove custom number of input fields.
  - Add and delete video tags.
  - Add and delete video entries.
  - Edit timestamps, song titles, lyrics, url and artist/band name.

- Viewer: 
  - Explore the full library.
  - Search videos by song title, artist or lyrics.
  - Explore videos by tag.
  - Get a random video.
  - Click on a button to share a specific video.

## Features
- Developed a relational database system (PostgreSQL), and a Rails (RESTful) API backend with endpoints for videos, tagged videos, random video, tags, searched results, and auth.
- Utilized JSON Web Tokens and local storage to store encrypted user information client-side and bcrypt server-side. 
- Further secured credential management by storing config in env variable.
- Ability to seamlessly add or remove input fields dynamically.
- Utilized Atlassian library to build drag and drop functionality accessible by keyboard as well.
- Fine tuned search and discovery capabilities via Elasticsearch and autocomplete.
- Executed server and client side pagination using React Hooks.
- Delivered a fully responsive site with the ability to toggle smoothly between list and grid view.
- Optimized pages for fast loading.
- Simplified the process for adding timestamps to each video with an intuitive slider.
- Built functional and class components, utilizing their life cycles, props and states via React’s structural hierarchy, and store via Redux library for scalability.
- Styled using React-Bootstrap (installed via CDN), Sass, and custom CSS3.

 ## Walkthrough
[See a video demo of the app's functionality.](https://vimeo.com/481551182/c203801a37 "Saicophonic Medicine Demo") 

## Contact
hi@nataliagalan.me | [Visit my LinkedIn](https://linkedin.com/in/natalia-galan "Natalia Galán LinkedIn") 
