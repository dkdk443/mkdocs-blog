# Use the official Python image as the base image
FROM python:3.8-slim

# Set the working directory inside the container
WORKDIR /docs

# Install Git
RUN apt-get update && apt-get install -y git

# Install MkDocs and the Material theme
RUN pip install mkdocs-material

# Install the mkdocs-rss-plugin
RUN pip install mkdocs-rss-plugin

# Set the Git Python environment variable to avoid the warning
ENV GIT_PYTHON_REFRESH quiet

# Expose the default MkDocs port
EXPOSE 8000

# Command to run MkDocs when the container starts
CMD ["mkdocs", "serve", "--dev-addr=0.0.0.0:8000"]
