FROM node:4.2.1

# Mount your dev assets dir
VOLUME /var/build/input
# Mount your assets loading dir
VOLUME /var/build/output

WORKDIR /var/build

# Mount in your webpack.config.json
RUN touch webpack.config.json

RUN npm install -g webpack

RUN npm install webpack style-loader css-loader postcss-loader \
    postcss-import postcss-simple-vars postcss-nested \
    autoprefixer extract-text-webpack-plugin \
    html-loader ngtemplate-loader \
    babel-loader ng-annotate-loader

CMD ["webpack", "--colors", "--progress", "-d", "--watch"]
