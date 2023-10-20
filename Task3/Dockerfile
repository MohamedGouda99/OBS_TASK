# Use the base image
FROM postman/newman:5.3.1-alpine

# Update packages
RUN apk update && apk upgrade

# Globally install node module
RUN npm install -g newman-reporter-csvallinone

# Install extra packages
RUN apk add --no-cache curl zip iputils

# Set environment variable
ENV NODE_PATH=/usr/local/lib/node_modules

# Set working directory
WORKDIR /etc/newman

# Set entry point
ENTRYPOINT ["newman"]
