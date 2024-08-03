# nosonar
FROM mcr.microsoft.com/vscode/devcontainers/typescript-node:22 AS nextjs

RUN mkdir -p /nextjs

# Set the working directory
WORKDIR /nextjs

# Install pnpm globally
RUN npm install  --ignore-scripts -g pnpm --silent

# Install dependencies
COPY package.json .
# COPY pnpm-lock.yaml .
COPY package-lock.json .

# RUN pnpm install --silent
RUN npm install --silent --ignore-scripts

WORKDIR /nextjs

# Copy the source code
COPY app .
COPY components .
COPY config .
COPY lib .
COPY openapi-templates .
COPY public .
COPY styles .
COPY types .
COPY .eslintignore .
COPY .eslintrc.json .
COPY components.json .
COPY next-env.d.ts .
COPY next.config.js .
COPY openapitools.json .
COPY package-lock.json .
COPY package.json .
COPY pnpm-lock.yaml .
COPY postcss.config.js .
COPY tailwind.config.js .
COPY tailwind.config.ts .
COPY tsconfig.json .


# Expose the Next.js development server port
EXPOSE 8080

# Start the development server
CMD ["npm", "dev"]
