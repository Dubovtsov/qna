const { environment } = require('@rails/webpacker')

module.exports = environment

const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: ['popper.js', 'default'],
    toastr: 'toastr/toastr',
    ApexCharts: ['apexcharts', 'default'],
    underscore: ['underscore', 'm'],
    Rails: ['@rails/ujs']
  })
)
