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
  chown -R $USERNAME:$USERNAME /workspaces/$USERNAME

# Used to persist bash history as per https://code.visualstudio.com/remote/advancedcontainers/persist-bash-history
RUN SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.bash_history" \
  && mkdir /commandhistory \
  && touch /commandhistory/.bash_history \
  && chown -R $USERNAME /commandhistory \
  && echo "$SNIPPET" >> "/home/$USERNAME/.bashrc" \
  && echo "$SNIPPET" >> "/home/$USERNAME/.zshrc"


# Set the working directory inside the container
WORKDIR /workspaces/$USERNAME/frontend

# Copy the rest of the application code to the working directory
COPY . .

COPY --from=node_builder /workspaces/battle-stadium/frontend/node_modules /workspaces/battle-stadium/frontend/node_modules

# Expose a port if your application needs it
EXPOSE 5173

# Define the command to run your application
CMD [ "npm", "run", "dev", "--", "--host"]
