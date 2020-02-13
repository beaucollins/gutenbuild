FROM coplusco/wp-scripts:v1.2

ENTRYPOINT [ "/var/app/node_modules/.bin/wp-scripts", "build" ]