FROM coplusco/wp-scripts

ENTRYPOINT [ "/var/app/node_modules/.bin/wp-scripts", "build" ]