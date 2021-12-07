// const { webpackConfig } = require('@rails/webpacker')

// module.exports = webpackConfig

var webpack = require('webpack');
var path = require('path');
var assetsPath = '/assets/javascript';
var destinationPointPath = '/dist';
// Why use ProvidePlugin and externals: http://stackoverflow.com/a/30587246/1771644
module.exports = {

    entry: `${__dirname}` + '/javascript/src/app.js',
    output: {
        path: `${__dirname}`+ '/dist',
        filename: 'co.js'
    },
    resolve :{
        extensions: ["", ".js"]
    },
    externals: {
        "jquery": "jQuery"
    },
    module: {
        rules: [
            {
                test: /\.css$/, loader: 'style-loader!css-loader'
            },
            {
                test: /\.js$/, loader: 'babel',
                exclude: /(node_modules|bower_components)/,
                query: {
                    presets: ['es2015']
                }
            }
        ]
    },
    plugins: [
        new webpack.ProvidePlugin({
            $: "jquery"
        })
    ]
}
