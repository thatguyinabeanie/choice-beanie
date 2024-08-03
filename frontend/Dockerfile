# nosonar
FROM mcr.microsoft.com/vscode/devcontainers/typescript-node:22 AS nextjs

RUN mkdir -p /nextjs

# Set the working directory
WORKDIR /nextjs

# Install pnpm globally
RUN npm install  --ignore-scripts -g pnpm --silent

WORKDIR /nextjs

# Install dependencies
COPY frontend/package.json .
COPY pnpm-lock.yaml .

RUN pnpm install --silent --ignore-scripts

# Copy the source code
COPY frontend/app .
COPY frontend/components .
COPY frontend/config .
COPY frontend/lib .
COPY frontend/openapi-templates .
COPY frontend/public .
COPY frontend/styles .
COPY frontend/types .
COPY frontend/.eslintignore .
COPY frontend/.eslintrc.json .
COPY frontend/components.json .
COPY frontend/next-env.d.ts .
COPY frontend/next.config.js .
COPY frontend/openapitools.json .
COPY frontend/package.json .
COPY frontend/postcss.config.js .
COPY frontend/tailwind.config.js .
COPY frontend/tailwind.config.ts .
COPY frontend/tsconfig.json .

# Expose the Next.js development server port
EXPOSE 8080

# Start the development server
CMD ["npm", "dev"]
