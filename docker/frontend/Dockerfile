# build static files in watch mode
FROM node:14.21.3-bullseye as static 

ADD docker/frontend/start-npm.sh .

RUN chmod +x start-npm.sh

CMD ["bash", "-c", "./start-npm.sh"]
