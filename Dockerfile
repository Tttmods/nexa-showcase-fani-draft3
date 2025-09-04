FROM node:22

WORKDIR /app

# Install build tools for native modules
RUN apt-get update && apt-get install -y     build-essential     python3     git     && rm -rf /var/lib/apt/lists/*

# Copy package files
COPY package*.json ./

# Install dependencies (fetches passport-discord from GitHub)
RUN npm install --omit=dev

# Copy rest of project
COPY . .

# Expose dashboard port
EXPOSE 3000

# Start bot + dashboard
CMD ["node", "index.js"]
