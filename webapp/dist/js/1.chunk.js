webpackJsonp([1],[
/* 0 */,
/* 1 */,
/* 2 */,
/* 3 */,
/* 4 */,
/* 5 */,
/* 6 */
/***/ function(module, exports, __webpack_require__) {

	var __vue_exports__, __vue_options__
	var __vue_styles__ = {}
	
	/* styles */
	__webpack_require__(7)
	
	/* script */
	__vue_exports__ = __webpack_require__(11)
	
	/* template */
	var __vue_template__ = __webpack_require__(12)
	__vue_options__ = __vue_exports__ = __vue_exports__ || {}
	if (
	  typeof __vue_exports__.default === "object" ||
	  typeof __vue_exports__.default === "function"
	) {
	if (Object.keys(__vue_exports__).some(function (key) { return key !== "default" && key !== "__esModule" })) {console.error("named exports are not supported in *.vue files.")}
	__vue_options__ = __vue_exports__ = __vue_exports__.default
	}
	if (typeof __vue_options__ === "function") {
	  __vue_options__ = __vue_options__.options
	}
	__vue_options__.__file = "D:\\code\\php\\htdocs\\Hybrid-App\\webapp\\src\\pages\\home\\home.vue"
	__vue_options__.render = __vue_template__.render
	__vue_options__.staticRenderFns = __vue_template__.staticRenderFns
	__vue_options__._scopeId = "data-v-4c318122"
	
	/* hot reload */
	if (false) {(function () {
	  var hotAPI = require("vue-hot-reload-api")
	  hotAPI.install(require("vue"), false)
	  if (!hotAPI.compatible) return
	  module.hot.accept()
	  if (!module.hot.data) {
	    hotAPI.createRecord("data-v-4c318122", __vue_options__)
	  } else {
	    hotAPI.reload("data-v-4c318122", __vue_options__)
	  }
	})()}
	if (__vue_options__.functional) {console.error("[vue-loader] home.vue: functional components are not supported and should be defined in plain js files using render functions.")}
	
	module.exports = __vue_exports__


/***/ },
/* 7 */
/***/ function(module, exports, __webpack_require__) {

	// style-loader: Adds some css to the DOM by adding a <style> tag
	
	// load the styles
	var content = __webpack_require__(8);
	if(typeof content === 'string') content = [[module.id, content, '']];
	// add the styles to the DOM
	var update = __webpack_require__(10)(content, {});
	if(content.locals) module.exports = content.locals;
	// Hot Module Replacement
	if(false) {
		// When the styles change, update the <style> tags
		if(!content.locals) {
			module.hot.accept("!!./../../../node_modules/css-loader/index.js?sourceMap!./../../../node_modules/vue-loader/lib/style-rewriter.js?id=data-v-4c318122&scoped=true!./../../../node_modules/sass-loader/index.js!./home.scss", function() {
				var newContent = require("!!./../../../node_modules/css-loader/index.js?sourceMap!./../../../node_modules/vue-loader/lib/style-rewriter.js?id=data-v-4c318122&scoped=true!./../../../node_modules/sass-loader/index.js!./home.scss");
				if(typeof newContent === 'string') newContent = [[module.id, newContent, '']];
				update(newContent);
			});
		}
		// When the module is disposed, remove the <style> tags
		module.hot.dispose(function() { update(); });
	}

/***/ },
/* 8 */
/***/ function(module, exports, __webpack_require__) {

	exports = module.exports = __webpack_require__(9)();
	// imports
	
	
	// module
	exports.push([module.id, "\n.mint-swipe[data-v-4c318122] {\n  height: 3.06667rem;\n  margin-bottom: 10px;\n}\n.mint-swipe .mint-swipe-item[data-v-4c318122] {\n    width: 100%;\n    height: 100%;\n}\n.mint-swipe .mint-swipe-item img[data-v-4c318122] {\n      width: 100%;\n      height: 100%;\n}\n.list .item[data-v-4c318122] {\n  display: table;\n  position: relative;\n  width: 100%;\n  padding: 0.26667rem 0 0.13333rem 0;\n  background: #fff;\n}\n.list .item .left[data-v-4c318122], .list .item .right[data-v-4c318122] {\n    display: table-cell;\n    vertical-align: top;\n}\n.list .item .left[data-v-4c318122] {\n    width: 3.14667rem;\n    height: 2.24rem;\n}\n.list .item .left img[data-v-4c318122] {\n      width: 100%;\n      height: 100%;\n}\n.list .item .right[data-v-4c318122] {\n    padding: 0 0.53333rem;\n}\n.list .item .right .text[data-v-4c318122] {\n      height: 2.24rem;\n}\n.list .item .right .text .name[data-v-4c318122] {\n        line-height: 22px;\n        font-weight: 500;\n        display: -webkit-box;\n        -webkit-line-clamp: 2;\n        -webkit-box-orient: vertical;\n        overflow: hidden;\n        text-overflow: ellipsis;\n        margin-bottom: 0.16rem;\n}\n.list .item .right .text .attention[data-v-4c318122] {\n        overflow: hidden;\n}\n.list .item .right .text .attention .tip[data-v-4c318122] {\n          display: block;\n          float: left;\n          line-height: 16px;\n          font-size: 10px;\n}\n.list .item .right .text .attention .opera[data-v-4c318122] {\n          position: relative;\n          float: right;\n          width: 58px;\n          height: 16px;\n          background-color: #F3F5F7;\n}\n.list .item .right .text .attention .opera .icon-box[data-v-4c318122] {\n            position: absolute;\n            top: 0;\n            left: 0;\n            width: 16px;\n            height: 16px;\n            background-color: inherit;\n}\n.list .item .right .text .attention .opera .icon-box .iconfont[data-v-4c318122] {\n              display: block;\n              font-size: 8px;\n}\n.list .item .bottom-line[data-v-4c318122] {\n    position: absolute;\n    left: 0;\n    bottom: 0;\n    width: 9.46667rem;\n    font-size: 0 !important;\n    -webkit-text-size-adjust: none;\n    height: 1px;\n    margin-left: 0.53333rem;\n    background: #f3f3f3;\n}\n", "", {"version":3,"sources":["/./src/pages/home/home.scss"],"names":[],"mappings":";AAAA;EACE,mBAAmB;EACnB,oBAAoB;CAAE;AACtB;IACE,YAAY;IACZ,aAAa;CAAE;AACf;MACE,YAAY;MACZ,aAAa;CAAE;AAErB;EACE,eAAe;EACf,mBAAmB;EACnB,YAAY;EACZ,mCAAmC;EACnC,iBAAiB;CAAE;AACnB;IACE,oBAAoB;IACpB,oBAAoB;CAAE;AACxB;IACE,kBAAkB;IAClB,gBAAgB;CAAE;AAClB;MACE,YAAY;MACZ,aAAa;CAAE;AACnB;IACE,sBAAsB;CAAE;AACxB;MACE,gBAAgB;CAAE;AAClB;QACE,kBAAkB;QAClB,iBAAiB;QACjB,qBAAqB;QACrB,sBAAsB;QACtB,6BAA6B;QAC7B,iBAAiB;QACjB,wBAAwB;QACxB,uBAAuB;CAAE;AAC3B;QACE,iBAAiB;CAAE;AACnB;UACE,eAAe;UACf,YAAY;UACZ,kBAAkB;UAClB,gBAAgB;CAAE;AACpB;UACE,mBAAmB;UACnB,aAAa;UACb,YAAY;UACZ,aAAa;UACb,0BAA0B;CAAE;AAC5B;YACE,mBAAmB;YACnB,OAAO;YACP,QAAQ;YACR,YAAY;YACZ,aAAa;YACb,0BAA0B;CAAE;AAC5B;cACE,eAAe;cACf,eAAe;CAAE;AAC7B;IACE,mBAAmB;IACnB,QAAQ;IACR,UAAU;IACV,kBAAkB;IAClB,wBAAwB;IACxB,+BAA+B;IAC/B,YAAY;IACZ,wBAAwB;IACxB,oBAAoB;CAAE","file":"home.scss","sourcesContent":[".mint-swipe {\n  height: 3.06667rem;\n  margin-bottom: 10px; }\n  .mint-swipe .mint-swipe-item {\n    width: 100%;\n    height: 100%; }\n    .mint-swipe .mint-swipe-item img {\n      width: 100%;\n      height: 100%; }\n\n.list .item {\n  display: table;\n  position: relative;\n  width: 100%;\n  padding: 0.26667rem 0 0.13333rem 0;\n  background: #fff; }\n  .list .item .left, .list .item .right {\n    display: table-cell;\n    vertical-align: top; }\n  .list .item .left {\n    width: 3.14667rem;\n    height: 2.24rem; }\n    .list .item .left img {\n      width: 100%;\n      height: 100%; }\n  .list .item .right {\n    padding: 0 0.53333rem; }\n    .list .item .right .text {\n      height: 2.24rem; }\n      .list .item .right .text .name {\n        line-height: 22px;\n        font-weight: 500;\n        display: -webkit-box;\n        -webkit-line-clamp: 2;\n        -webkit-box-orient: vertical;\n        overflow: hidden;\n        text-overflow: ellipsis;\n        margin-bottom: 0.16rem; }\n      .list .item .right .text .attention {\n        overflow: hidden; }\n        .list .item .right .text .attention .tip {\n          display: block;\n          float: left;\n          line-height: 16px;\n          font-size: 10px; }\n        .list .item .right .text .attention .opera {\n          position: relative;\n          float: right;\n          width: 58px;\n          height: 16px;\n          background-color: #F3F5F7; }\n          .list .item .right .text .attention .opera .icon-box {\n            position: absolute;\n            top: 0;\n            left: 0;\n            width: 16px;\n            height: 16px;\n            background-color: inherit; }\n            .list .item .right .text .attention .opera .icon-box .iconfont {\n              display: block;\n              font-size: 8px; }\n  .list .item .bottom-line {\n    position: absolute;\n    left: 0;\n    bottom: 0;\n    width: 9.46667rem;\n    font-size: 0 !important;\n    -webkit-text-size-adjust: none;\n    height: 1px;\n    margin-left: 0.53333rem;\n    background: #f3f3f3; }\n"],"sourceRoot":"webpack://"}]);
	
	// exports


/***/ },
/* 9 */,
/* 10 */
/***/ function(module, exports, __webpack_require__) {

	/*
		MIT License http://www.opensource.org/licenses/mit-license.php
		Author Tobias Koppers @sokra
	*/
	var stylesInDom = {},
		memoize = function(fn) {
			var memo;
			return function () {
				if (typeof memo === "undefined") memo = fn.apply(this, arguments);
				return memo;
			};
		},
		isOldIE = memoize(function() {
			return /msie [6-9]\b/.test(window.navigator.userAgent.toLowerCase());
		}),
		getHeadElement = memoize(function () {
			return document.head || document.getElementsByTagName("head")[0];
		}),
		singletonElement = null,
		singletonCounter = 0,
		styleElementsInsertedAtTop = [];
	
	module.exports = function(list, options) {
		if(false) {
			if(typeof document !== "object") throw new Error("The style-loader cannot be used in a non-browser environment");
		}
	
		options = options || {};
		// Force single-tag solution on IE6-9, which has a hard limit on the # of <style>
		// tags it will allow on a page
		if (typeof options.singleton === "undefined") options.singleton = isOldIE();
	
		// By default, add <style> tags to the bottom of <head>.
		if (typeof options.insertAt === "undefined") options.insertAt = "bottom";
	
		var styles = listToStyles(list);
		addStylesToDom(styles, options);
	
		return function update(newList) {
			var mayRemove = [];
			for(var i = 0; i < styles.length; i++) {
				var item = styles[i];
				var domStyle = stylesInDom[item.id];
				domStyle.refs--;
				mayRemove.push(domStyle);
			}
			if(newList) {
				var newStyles = listToStyles(newList);
				addStylesToDom(newStyles, options);
			}
			for(var i = 0; i < mayRemove.length; i++) {
				var domStyle = mayRemove[i];
				if(domStyle.refs === 0) {
					for(var j = 0; j < domStyle.parts.length; j++)
						domStyle.parts[j]();
					delete stylesInDom[domStyle.id];
				}
			}
		};
	}
	
	function addStylesToDom(styles, options) {
		for(var i = 0; i < styles.length; i++) {
			var item = styles[i];
			var domStyle = stylesInDom[item.id];
			if(domStyle) {
				domStyle.refs++;
				for(var j = 0; j < domStyle.parts.length; j++) {
					domStyle.parts[j](item.parts[j]);
				}
				for(; j < item.parts.length; j++) {
					domStyle.parts.push(addStyle(item.parts[j], options));
				}
			} else {
				var parts = [];
				for(var j = 0; j < item.parts.length; j++) {
					parts.push(addStyle(item.parts[j], options));
				}
				stylesInDom[item.id] = {id: item.id, refs: 1, parts: parts};
			}
		}
	}
	
	function listToStyles(list) {
		var styles = [];
		var newStyles = {};
		for(var i = 0; i < list.length; i++) {
			var item = list[i];
			var id = item[0];
			var css = item[1];
			var media = item[2];
			var sourceMap = item[3];
			var part = {css: css, media: media, sourceMap: sourceMap};
			if(!newStyles[id])
				styles.push(newStyles[id] = {id: id, parts: [part]});
			else
				newStyles[id].parts.push(part);
		}
		return styles;
	}
	
	function insertStyleElement(options, styleElement) {
		var head = getHeadElement();
		var lastStyleElementInsertedAtTop = styleElementsInsertedAtTop[styleElementsInsertedAtTop.length - 1];
		if (options.insertAt === "top") {
			if(!lastStyleElementInsertedAtTop) {
				head.insertBefore(styleElement, head.firstChild);
			} else if(lastStyleElementInsertedAtTop.nextSibling) {
				head.insertBefore(styleElement, lastStyleElementInsertedAtTop.nextSibling);
			} else {
				head.appendChild(styleElement);
			}
			styleElementsInsertedAtTop.push(styleElement);
		} else if (options.insertAt === "bottom") {
			head.appendChild(styleElement);
		} else {
			throw new Error("Invalid value for parameter 'insertAt'. Must be 'top' or 'bottom'.");
		}
	}
	
	function removeStyleElement(styleElement) {
		styleElement.parentNode.removeChild(styleElement);
		var idx = styleElementsInsertedAtTop.indexOf(styleElement);
		if(idx >= 0) {
			styleElementsInsertedAtTop.splice(idx, 1);
		}
	}
	
	function createStyleElement(options) {
		var styleElement = document.createElement("style");
		styleElement.type = "text/css";
		insertStyleElement(options, styleElement);
		return styleElement;
	}
	
	function addStyle(obj, options) {
		var styleElement, update, remove;
	
		if (options.singleton) {
			var styleIndex = singletonCounter++;
			styleElement = singletonElement || (singletonElement = createStyleElement(options));
			update = applyToSingletonTag.bind(null, styleElement, styleIndex, false);
			remove = applyToSingletonTag.bind(null, styleElement, styleIndex, true);
		} else {
			styleElement = createStyleElement(options);
			update = applyToTag.bind(null, styleElement);
			remove = function() {
				removeStyleElement(styleElement);
			};
		}
	
		update(obj);
	
		return function updateStyle(newObj) {
			if(newObj) {
				if(newObj.css === obj.css && newObj.media === obj.media && newObj.sourceMap === obj.sourceMap)
					return;
				update(obj = newObj);
			} else {
				remove();
			}
		};
	}
	
	var replaceText = (function () {
		var textStore = [];
	
		return function (index, replacement) {
			textStore[index] = replacement;
			return textStore.filter(Boolean).join('\n');
		};
	})();
	
	function applyToSingletonTag(styleElement, index, remove, obj) {
		var css = remove ? "" : obj.css;
	
		if (styleElement.styleSheet) {
			styleElement.styleSheet.cssText = replaceText(index, css);
		} else {
			var cssNode = document.createTextNode(css);
			var childNodes = styleElement.childNodes;
			if (childNodes[index]) styleElement.removeChild(childNodes[index]);
			if (childNodes.length) {
				styleElement.insertBefore(cssNode, childNodes[index]);
			} else {
				styleElement.appendChild(cssNode);
			}
		}
	}
	
	function applyToTag(styleElement, obj) {
		var css = obj.css;
		var media = obj.media;
		var sourceMap = obj.sourceMap;
	
		if (media) {
			styleElement.setAttribute("media", media);
		}
	
		if (sourceMap) {
			// https://developer.chrome.com/devtools/docs/javascript-debugging
			// this makes source maps inside style tags work properly in Chrome
			css += '\n/*# sourceURL=' + sourceMap.sources[0] + ' */';
			// http://stackoverflow.com/a/26603875
			css += "\n/*# sourceMappingURL=data:application/json;base64," + btoa(unescape(encodeURIComponent(JSON.stringify(sourceMap)))) + " */";
		}
	
		if (styleElement.styleSheet) {
			styleElement.styleSheet.cssText = css;
		} else {
			while(styleElement.firstChild) {
				styleElement.removeChild(styleElement.firstChild);
			}
			styleElement.appendChild(document.createTextNode(css));
		}
	}


/***/ },
/* 11 */
/***/ function(module, exports) {

	'use strict';
	
	Object.defineProperty(exports, "__esModule", {
	    value: true
	});
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	
	exports.default = {
	    data: function data() {
	        return {
	            urls: ['../style/images/1.jpg', '../style/images/2.jpg', '../style/images/3.jpg']
	        };
	    }
	};

/***/ },
/* 12 */
/***/ function(module, exports, __webpack_require__) {

	module.exports={render:function (){var _vm=this;
	  return _vm._h('div', {
	    staticClass: "pages"
	  }, [_vm._h('div', {
	    staticClass: "page"
	  }, [_vm._h('div', {
	    staticClass: "scroll-body"
	  }, [_vm._h('mt-swipe', {
	    attrs: {
	      "auto": 4000
	    }
	  }, [_vm._l((_vm.urls), function(url) {
	    return [_vm._h('mt-swipe-item', [_vm._h('img', {
	      attrs: {
	        "src": url,
	        "alt": "",
	        "width": "100%"
	      }
	    })])]
	  })]), " ", _vm._m(0)])])])
	},staticRenderFns: [function (){var _vm=this;
	  return _vm._h('ul', {
	    staticClass: "list"
	  }, [_vm._h('li', {
	    staticClass: "item"
	  }, [_vm._h('div', {
	    staticClass: "left default-img"
	  }), " ", _vm._h('div', {
	    staticClass: "right"
	  }, [_vm._h('div', {
	    staticClass: "text"
	  }, [_vm._h('h6', {
	    staticClass: "name"
	  }, ["1111专注公版-602-休闲工装鞋子36-42"]), " ", _vm._h('div', {
	    staticClass: "attention"
	  }, [_vm._h('span', {
	    staticClass: "tip"
	  }, ["专注公版"]), " ", _vm._h('a', {
	    staticClass: "opera"
	  }, [_vm._h('div', {
	    staticClass: "icon-box flex-cm"
	  }, [_vm._h('i', {
	    staticClass: "iconfont"
	  }, [""])])])])])]), " ", _vm._h('div', {
	    staticClass: "bottom-line"
	  })])])
	}]}
	if (false) {
	  module.hot.accept()
	  if (module.hot.data) {
	     require("vue-hot-reload-api").rerender("data-v-4c318122", module.exports)
	  }
	}

/***/ }
]);
//# sourceMappingURL=1.chunk.js.map