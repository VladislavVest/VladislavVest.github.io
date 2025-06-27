# Use the official Node.js 18 LTS image
FROM node:18

# Set the working directory inside the container
WORKDIR /workdir

# Copy the entire project into the container
COPY . /workdir

# Remove the .github folder from the original_repo if it exists
RUN rm -rf /workdir/original_repo/.github

# Move into the original_repo folder
WORKDIR /workdir/original_repo

# Install dependencies and run tests
RUN npm install && npm test

# Default command after build completes
CMD [ "echo", "✅ All tests passed in original_repo" ]
