# Generative art with Processing.js
Experiments with generative art. Check out branches for each project.

## Demos

### [Constellations](http://piratefsh.github.io/generative-art/public/constellations/)
<iframe height="200" width="100%"  src="http://piratefsh.github.io/generative-art/public/constellations/"></iframe>

### [Crystaline](http://piratefsh.github.io/generative-art/public/trees/)
inspired by [p5p.cecinestpasparis.net](http://p5p.cecinestpasparis.net/)

### [Shells](http://piratefsh.github.io/generative-art/public/shells/)
inspired by [p5p.cecinestpasparis.net](http://p5p.cecinestpasparis.net/)

### [Intersections](http://piratefsh.github.io/generative-art/public/intersections/). 
inspired by [j.tarbell](http://www.complexification.net/gallery/machines/interMomentary/index.php)

### [Color typewriter](http://piratefsh.github.io/generative-art/public/typewriter/). 
Not quite generative art, but fun. 
 
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
