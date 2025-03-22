# Stage 1: Build the task binary
FROM golang:alpine AS build

ARG TASKFILE_VERSION=latest

RUN go install github.com/go-task/task/v3/cmd/task@${TASKFILE_VERSION}

# Stage 2: Use willhallonline/ansible as the base image for the final image
FROM willhallonline/ansible:latest AS final

# Copy the task binary from the build stage
COPY --from=build /go/bin/task /usr/local/bin/task

# You can also set up your Ansible environment here if needed (e.g., adding playbooks, inventory files)

# Set the entrypoint to use Task or Ansible as needed
# ENTRYPOINT [ "/usr/local/bin/task" ]
