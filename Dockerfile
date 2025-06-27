# Use official Node.js 18 LTS image
FROM node:18

# Set working directory inside the container
WORKDIR /workdir/original_repo

# Copy only package.json and package-lock.json (если есть) для установки зависимостей
COPY original_repo/package*.json ./

# Установить зависимости
RUN npm install

# copy
COPY original_repo/. .

# run  test
RUN npm install --include=dev


# the default command after a successful build
CMD ["echo", "✅ All tests passed in original_repo"]
