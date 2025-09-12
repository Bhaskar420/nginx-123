# Base ArangoDB image from Docker Hub
FROM arangodb:3.11

# Set environment variables
ENV ARANGO_ROOT_PASSWORD=mysecret

# Expose ArangoDB port
EXPOSE 8529

# Default command
CMD ["arangod"]

