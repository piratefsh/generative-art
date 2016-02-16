# Generative art with Processing.js
Experiments with generative art. Check out branches for each project.

## Demos

### [Constellations](http://piratefsh.github.io/generative-art/public/constellations/)
![constellations](http://piratefsh.github.io/generative-art/public/_images/constellations.gif)

### [Constellations 3D](http://piratefsh.github.io/generative-art/public/constellations3d/)
![constellations](http://piratefsh.github.io/generative-art/public/_images/constellations3d.gif)

### [Crystaline](http://piratefsh.github.io/generative-art/public/trees/)
![constellations](http://piratefsh.github.io/generative-art/public/_images/trees.gif)
inspired by [p5p.cecinestpasparis.net](http://p5p.cecinestpasparis.net/)

### [Shells](http://piratefsh.github.io/generative-art/public/shells/)
![constellations](http://piratefsh.github.io/generative-art/public/_images/shells.gif)
inspired by [p5p.cecinestpasparis.net](http://p5p.cecinestpasparis.net/)

### [Intersections](http://piratefsh.github.io/generative-art/public/intersections/). 
![constellations](http://piratefsh.github.io/generative-art/public/_images/intersections.gif)
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
