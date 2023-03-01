"use strict";
(self["webpackChunkapp"] = self["webpackChunkapp"] || []).push([["application"],{

/***/ "./app/packs/entrypoints/application.js":
/*!**********************************************!*\
  !*** ./app/packs/entrypoints/application.js ***!
  \**********************************************/
/***/ (function(__unused_webpack_module, __webpack_exports__, __webpack_require__) {

__webpack_require__.r(__webpack_exports__);
/* harmony import */ var toastr__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! toastr */ "./node_modules/toastr/toastr.js");
/* harmony import */ var toastr__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(toastr__WEBPACK_IMPORTED_MODULE_0__);
/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/packs and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// Activate Active Storage
// import * as ActiveStorage from "@rails/activestorage"
// ActiveStorage.start()

var Trix = __webpack_require__(/*! trix */ "./node_modules/trix/dist/trix.js");
__webpack_require__(/*! @rails/actiontext */ "./node_modules/@rails/actiontext/app/assets/javascripts/actiontext.js");
(__webpack_require__(/*! @rails/activestorage */ "./node_modules/@rails/activestorage/app/assets/javascripts/activestorage.esm.js").start)();
Trix.config.blockAttributes.heading1.tagName = "h2";

__webpack_require__.g.toastr = (toastr__WEBPACK_IMPORTED_MODULE_0___default());
(toastr__WEBPACK_IMPORTED_MODULE_0___default().options.closeButton) = true;
(toastr__WEBPACK_IMPORTED_MODULE_0___default().options.timeOut) = 3000;
(toastr__WEBPACK_IMPORTED_MODULE_0___default().options.closeDuration) = 300;

/***/ })

},
/******/ function(__webpack_require__) { // webpackRuntimeModules
/******/ var __webpack_exec__ = function(moduleId) { return __webpack_require__(__webpack_require__.s = moduleId); }
/******/ __webpack_require__.O(0, ["vendors-node_modules_rails_activestorage_app_assets_javascripts_activestorage_esm_js-node_mod-911a52"], function() { return __webpack_exec__("./app/packs/entrypoints/application.js"); });
/******/ var __webpack_exports__ = __webpack_require__.O();
/******/ }
]);
//# sourceMappingURL=application.js.map