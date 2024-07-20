# Use the latest LTS version of Node.js as the base image

FROM node:22 AS node_builder
RUN mkdir -p /workspaces/battle-stadium/frontend
WORKDIR /workspaces/battle-stadium/frontend
COPY package*.json ./
RUN npm install


FROM node:22
ARG USERNAME=battle-stadium

RUN mkdir -p /workspaces/$USERNAME/frontend && \
  groupadd -r $USERNAME && \
  useradd -m -d /home/$USERNAME --no-log-init -r -g $USERNAME $USERNAME && \
  chown -R $USERNAME:$USERNAME /workspaces/$USERNAME/frontend

USER $USERNAME

# Set the working directory inside the container
WORKDIR /workspaces/$USERNAME/frontend

# Copy the rest of the application code to the working directory
COPY public src index.html jest.config.ts tsconfig.app.json tsconfig.json tsconfig.node.json vite.config.ts .eslintrc.cjs /workspaces/$USERNAME/frontend/

COPY --from=node_builder /workspaces/battle-stadium/frontend/node_modules /workspaces/battle-stadium/frontend/node_modules

# Expose a port if your application needs it
EXPOSE 5173

# Define the command to run your application
CMD [ "npm", "run", "dev", "--", "--host"]
