FROM docker.io/library/alpine

# Install necessary packages
RUN apk add --no-cache sudo shadow

# Add a new user without prompting for a password
RUN adduser -D amibey

# Add the user to the wheel group to allow sudo access
RUN adduser amibey wheel

# Configure sudoers to allow users in the wheel group to use sudo without a password
RUN echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Optional: Set a password for the new user
RUN echo "amibey:abcd.123" | chpasswd

# Set the user and work directory for subsequent commands
USER amibey
WORKDIR /home/amibey

