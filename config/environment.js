const { environment } = require('@rails/webpacker')

const fileLoader = environment.loaders.get('file')
fileLoader.exclude = /node_modules[\\/]quill/

const svgLoader = {
  test: /\.svg$/,
  loader: 'svg-inline-loader'
}

environment.loaders.prepend('svg', svgLoader)

//const webpack = require('webpack')
//
//environment.plugins.prepend('Provide',
//  new webpack.ProvidePlugin({
//    $: 'jquery/src/jquery',
//    jQuery: 'jquery/src/jquery'
//  })
//)

module.exports = environment
