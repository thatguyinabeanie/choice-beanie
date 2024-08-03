/** @type {import('next').NextConfig} */

const dotenv = require('dotenv');

dotenv.config();

const nextConfig = {
  env: {
    API_BASE_URL: process.env.API_BASE_URL || 'http://localhost:3000',
  },
}

module.exports = nextConfig
