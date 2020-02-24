/* eslint-disable */
const withLess = require("@zeit/next-less");
const withCss = require("@zeit/next-css");
const withPlugins = require("next-compose-plugins");

// fix: prevents error when .less files are required by node
if (typeof require !== 'undefined') {
  require.extensions['.less'] = (file) => {}
}

// module.exports = withLess({
//   lessLoaderOptions: {
//     javascriptEnabled: true,
//   },
// })
module.exports = withPlugins([withLess,withCss],{
  lessLoaderOptions: {
    javascriptEnabled: true,
  },
})