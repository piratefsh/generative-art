# Generative art with Processing.js

##Demos for FOSSASIA 2016.

### Ball demo

uncomment `main_bounce.pde` in `app/components/art.js`

### Koch snowflake demo

uncomment `main_koch.pde` in `app/components/art.js`
 
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
