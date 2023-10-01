# Use an official Ruby runtime as a parent image
FROM ruby:3.1.0
ENV NODE_VERSION=16.13.0

# Set the working directory
WORKDIR /app

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    nodejs \
    postgresql-client \
    libmagickwand-dev \
    pkg-config \
    libopenexr-dev \
    libswscale-dev \
    libboost-dev \
    imagemagick && \
    rm -rf /var/lib/apt/lists/*

ENV PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
RUN node --version
RUN npm --version

RUN 
# Install gems
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && \
    bundle install --jobs 4

# Install packages
COPY package.json yarn.lock ./
RUN npm install --global yarn && \
    yarn install

# Copy the application code
COPY . .

# Expose ports
EXPOSE 3000
# rack-livereload
EXPOSE 35729

RUN guard --force-polling

# Set the entrypoint command
CMD ["bin/rails", "server", "-b", "0.0.0.0"]