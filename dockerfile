FROM nginx:latest
LABEL maintainer="Krishnendu Sekhar Das"

# setup default site
RUN mkdir /opt/startup
COPY startup /opt/startup
RUN chmod -R +x /opt/startup

ENV PORT 8080
EXPOSE 8080

ENV WEBSITE_ROLE_INSTANCE_ID localRoleInstance
ENV WEBSITE_INSTANCE_ID localInstance
ENV PATH ${PATH}:/home/site/wwwroot

WORKDIR /home/site/wwwroot
COPY dist ${WORKDIR}
COPY mysite /etc/nginx/sites-available/mysite
COPY nginx.conf /etc/nginx/nginx.conf
RUN mkdir /etc/nginx/sites-enabled

ENTRYPOINT ["/opt/startup/init_container.sh"]