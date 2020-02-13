FROM coplusco/wp-scripts:latest

ENTRYPOINT [ "/var/app/node_modules/.bin/wp-scripts", "build" ]