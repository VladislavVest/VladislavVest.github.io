FROM node:18

# Set working directory inside the container
WORKDIR /app/original_repo

# Copy only package.json and package-lock.json to leverage Docker cache
COPY original_repo/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the repository files
COPY original_repo/ ./

# Run tests using npm test (which runs "tap test" according to your package.json)
CMD ["npm", "test"]