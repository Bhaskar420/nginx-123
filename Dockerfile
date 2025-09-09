# Use the official Nginx image as a base
FROM nginx:1.25-alpine

# Switch to root to make changes
USER root

# 1. Change ownership of ALL directories Nginx needs to write to.
# The user and group '0' (root) is used here, but we will change permissions to be world-writable.
RUN chown -R 1001:0 /var/cache/nginx /var/run /var/log/nginx && \
    chmod -R g+w /var/cache/nginx /var/run /var/log/nginx

# 2. (Optional but Recommended) Modify the Nginx config to listen on a port > 1024.
# Non-root users cannot bind to privileged ports (like 80 or 443).
# This uses a simple sed command to change the port in the default config.
RUN sed -i 's/listen\(.*\)80;/listen\18081;/g' /etc/nginx/conf.d/default.conf
EXPOSE 8081

# 3. Switch to a non-root user. We use 1001, which is a common user ID in OpenShift.
# However, OpenShift will override this with a random UID. The key is the permissions we set above.
USER 1001

# The CMD from the base image remains the same
~                                                  
