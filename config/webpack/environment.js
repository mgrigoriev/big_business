const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

const datatables = require('./loaders/datatables')
environment.loaders.append('datatables', datatables)

environment.loaders.prepend('jquery', {
  test: require.resolve('jquery'),
  use: [{
    loader: 'expose-loader',
    options: 'jQuery'
  },{
    loader: 'expose-loader',
    options: '$'
  }]
})

environment.plugins.append('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
  })
)

module.exports = environment
