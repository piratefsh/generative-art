# Webpack Starter
Simple directory and config setup for a Webpack project with front-end web only. 

## Development 
### Install
```
npm install
npm install webpack-dev-server webpack -g
```

### Serve

To serve at http://localhost:8080/:

```
webpack-dev-server --inline  --content-base public/ 
```

### Build

To compile HTML/CSS and JavaScript files for production:

```
webpack --config webpack.config.js
```
