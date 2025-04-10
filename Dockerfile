#Base Image
FROM nginx:alpine

#Remove
RUN rm -rf /usr/share/nginx/html/

#Copy your htlm app to nginx web directory
COPY app/ /usr/share/nginx/html/*

#Expose port
EXPOSE 80


# Start Nginx (already done in base image's CMD)
