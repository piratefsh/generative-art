# Generative art with Processing.js
Experiments with generative art. Check out branches for each project.

## Demos
1. [Crystaline](http://piratefsh.github.io/generative-art/public/trees/)
2. [Intersections](http://piratefsh.github.io/generative-art/public/intersections/)
3. [Shells](http://piratefsh.github.io/generative-art/public/shells/)
4. [Color typewriter](http://piratefsh.github.io/generative-art/public/typewriter/). Not quite generative art, but fun. 
 
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
