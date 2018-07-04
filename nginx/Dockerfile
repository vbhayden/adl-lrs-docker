FROM nginx:1.15

# Set up our nginx logs
RUN mkdir /opt/lrs
RUN mkdir /opt/lrs/logs
RUN mkdir /opt/lrs/logs/nginx

# Set up our static content
COPY admin-static /opt/lrs/admin-static
COPY ep-static /opt/lrs/ep-static
COPY lrs-static /opt/lrs/lrs-static

# Lastly copy over our dummy self-signed ssl stuff
COPY default /etc/nginx/conf.d/default.conf
COPY ssl /etc/nginx/ssl
