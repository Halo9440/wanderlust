const express = require('express');
const cors = require('cors');
const app = express();
const PORT = 5000;

app.use(express.json());
app.use(cors());

// Demo data - no database needed
const demoPosts = [
  {
    id: 1,
    title: "Tropical Beach Paradise",
    description: "Relax on white sandy beaches with crystal clear waters",
    location: "Maldives",
    price: 1200,
    rating: 4.9
  },
  {
    id: 2,
    title: "Mountain Hiking Adventure",
    description: "Explore breathtaking mountain trails and scenic views",
    location: "Swiss Alps",
    price: 800,
    rating: 4.7
  },
  {
    id: 3,
    title: "City Culture Tour",
    description: "Immerse yourself in vibrant city life and rich culture",
    location: "Tokyo, Japan",
    price: 950,
    rating: 4.8
  }
];

// Routes
app.get('/', (req, res) => {
  res.json({
    success: true,
    message: 'Wanderlust Backend is Running',
    status: 'OK'
  });
});

app.get('/api/posts', (req, res) => {
  res.json({
    success: true,
    posts: demoPosts
  });
});

app.get('/api/posts/:id', (req, res) => {
  const post = demoPosts.find(p => p.id === parseInt(req.params.id));
  if (post) {
    res.json({ success: true, post });
  } else {
    res.status(404).json({ success: false, message: 'Post not found' });
  }
});

app.post('/api/auth/login', (req, res) => {
  res.json({
    success: true,
    user: {
      id: 1,
      name: 'Demo User',
      email: 'demo@wanderlust.com'
    },
    token: 'demo-jwt-token-12345',
    message: 'Login successful'
  });
});

app.post('/api/auth/register', (req, res) => {
  res.json({
    success: true,
    user: {
      id: 2,
      name: 'New User',
      email: 'user@example.com'
    },
    token: 'demo-jwt-token-67890',
    message: 'Registration successful'
  });
});

app.listen(PORT, '0.0.0.0', () => {
  console.log('Server running on port ' + PORT);
  console.log('Access: http://localhost:' + PORT);
});
