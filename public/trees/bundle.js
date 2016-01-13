/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	module.exports = __webpack_require__(1);


/***/ },
/* 1 */
/***/ function(module, exports, __webpack_require__) {

	'use strict';

	var _interopRequireDefault = __webpack_require__(2)['default'];

	var _art = __webpack_require__(3);

	var _art2 = _interopRequireDefault(_art);

	__webpack_require__(10);

	_art2['default'].init();

/***/ },
/* 2 */
/***/ function(module, exports) {

	"use strict";

	exports["default"] = function (obj) {
	  return obj && obj.__esModule ? obj : {
	    "default": obj
	  };
	};

	exports.__esModule = true;

/***/ },
/* 3 */
/***/ function(module, exports, __webpack_require__) {

	'use strict';

	var _interopRequireDefault = __webpack_require__(2)['default'];

	Object.defineProperty(exports, '__esModule', {
	    value: true
	});

	var _fileProcessingJsProcessingJs = __webpack_require__(4);

	var _fileProcessingJsProcessingJs2 = _interopRequireDefault(_fileProcessingJsProcessingJs);

	var _fileMainPde = __webpack_require__(5);

	var _fileMainPde2 = _interopRequireDefault(_fileMainPde);

	var _fileComponentsRecursiveCirclesPde = __webpack_require__(6);

	var _fileComponentsRecursiveCirclesPde2 = _interopRequireDefault(_fileComponentsRecursiveCirclesPde);

	var _fileComponentsEyePde = __webpack_require__(7);

	var _fileComponentsEyePde2 = _interopRequireDefault(_fileComponentsEyePde);

	var _fileComponentsTreePde = __webpack_require__(8);

	var _fileComponentsTreePde2 = _interopRequireDefault(_fileComponentsTreePde);

	var _fileComponentsColorTypewriterPde = __webpack_require__(9);

	var _fileComponentsColorTypewriterPde2 = _interopRequireDefault(_fileComponentsColorTypewriterPde);

	exports['default'] = {
	    init: function init() {

	        var processing = document.createElement('script');
	        processing.setAttribute('src', _fileProcessingJsProcessingJs2['default']);

	        processing.addEventListener('load', function () {
	            // set up processing sources
	            var canvas = document.getElementById('playground');

	            // processing instance

	            canvas.addEventListener('keydown', function (e) {
	                if (e.keyCode == 8) {
	                    e.preventDefault();
	                    var pInstance = Processing.getInstanceById('playground');
	                    pInstance.key = new Char(pInstance.CODED);
	                    pInstance.keyCode = new Char(pInstance.DELETE);
	                    pInstance.keyPressed();
	                }
	            });

	            var sources = [_fileMainPde2['default'], _fileComponentsRecursiveCirclesPde2['default'], _fileComponentsEyePde2['default'], _fileComponentsColorTypewriterPde2['default'], _fileComponentsTreePde2['default']];
	            canvas.setAttribute('data-processing-sources', sources.join(' '));

	            // reload Processing to catch changes
	            Processing.reload();
	        });

	        document.body.appendChild(processing);
	    }
	};
	module.exports = exports['default'];

/***/ },
/* 4 */
/***/ function(module, exports, __webpack_require__) {

	module.exports = __webpack_require__.p + "3865a96cd40d89f3bcec81ec14850000.js";

/***/ },
/* 5 */
/***/ function(module, exports, __webpack_require__) {

	module.exports = __webpack_require__.p + "f6125ca94388ca5d972b7fda3a410df5.pde";

/***/ },
/* 6 */
/***/ function(module, exports, __webpack_require__) {

	module.exports = __webpack_require__.p + "4e50ab47b16ceb8044a3adaec67f5f38.pde";

/***/ },
/* 7 */
/***/ function(module, exports, __webpack_require__) {

	module.exports = __webpack_require__.p + "fe330e31d73f1f321180c708f3b629ab.pde";

/***/ },
/* 8 */
/***/ function(module, exports, __webpack_require__) {

	module.exports = __webpack_require__.p + "9afb2bef5c2929a644bb712c0c09ce9c.pde";

/***/ },
/* 9 */
/***/ function(module, exports, __webpack_require__) {

	module.exports = __webpack_require__.p + "a433f2f33f5bba49a26c4297b46728fc.pde";

/***/ },
/* 10 */
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin

/***/ }
/******/ ]);