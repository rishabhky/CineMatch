const fetch = require('node-fetch');

const apiKey = '46ae5e509138252e260618e9809b0287';
const baseUrl = 'https://api.themoviedb.org/3';

// Get the total number of pages
fetch(`${baseUrl}/discover/movie?api_key=${apiKey}&sort_by=popularity.desc`)
  .then(res => res.json())
  .then(data => {
    const total_pages = data.total_pages;

    // Choose a random page
    const randomPage = Math.floor(Math.random() * total_pages) + 1;

    // Make a request to get a random movie from the chosen page
    return fetch(`${baseUrl}/discover/movie?api_key=${apiKey}&sort_by=popularity.desc&page=${randomPage}`);
  })
  .then(res => res.json())
  .then(data => {
    const results = data.results;

    // Choose a random movie from the results
    const randomMovie = results[Math.floor(Math.random() * results.length)];

    // Extract movie details
    const title = randomMovie.title;
    const overview = randomMovie.overview;
    const posterPath = randomMovie.poster_path;
    const posterUrl = `https://image.tmdb.org/t/p/w500/${posterPath}`;

    console.log(`Title: ${title}\nOverview: ${overview}\nPoster URL: ${posterUrl}`);
  })
  .catch(err => {
    console.error('Error fetching data:', err);
  });
