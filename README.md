# Generative art with Processing.js

Demos for FOSSASIA 2016.

For ball demo, uncomment `main_bounce.pde` in `art.js`
For Koch demo, uncomment `main_koch.pde` in `art.js`
 
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
