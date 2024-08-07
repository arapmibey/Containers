FROM docker.io/library/alpine

# Install necessary packages
RUN apk add --no-cache shadow

# Add a new user with a specified password
RUN useradd -m amibey && echo "amibey:abcd.123" | chpasswd

# Optional: add the user to the sudo group and install sudo if needed
RUN apk add --no-cache sudo && adduser amibey sudo

# Set the user and work directory for subsequent commands
USER amibey
WORKDIR /home/amibey
