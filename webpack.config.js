var path = require('path'),
    ExtractTextPlugin = require('extract-text-webpack-plugin')

module.exports = {
    entry: {
        app: ['./app/index.js']
    },
    output: {
        path: path.resolve(__dirname, 'public'),
        publicPath: '',
        filename: 'bundle.js'
    },
    module: {
        loaders: [
            // Babel loader
            {
                test: /\.jsx?$/,
                exclude: /(node_modules|bower_components)/,
                loader: 'babel?optional[]=runtime'
            },
            // CSS loader
            {
                test: /\.css$/,
                loader: ExtractTextPlugin.extract('style-loader', 'css-loader')
            },
            // SASS/SCSS
            {
                test: /\.(sass|scss)$/,
                loader: ExtractTextPlugin.extract('style-loader', 'css-loader!sass-loader')
            },
            // LESS
            {
                test: /\.less$/,
                loader: ExtractTextPlugin.extract('style-loader', 'css-loader!less-loader')
            },
            // Json
            {
                test: /\.json$/,
                loader: 'json'
            },
            // Images
            {
                test: /\.jpe?g$|\.gif$|\.png$|\.svg$/i, 
                loader: 'file'
            },
            // Fonts
            { 
                test: /\.woff(2)?(\?v=[0-9]\.[0-9]\.[0-9])?$/, 
                loader: "url-loader?limit=10000&minetype=application/font-woff" 
            },
            {
                test: /\.(ttf|eot|svg)(\?v=[0-9]\.[0-9]\.[0-9])?$/, 
                loader: "file-loader" 
            }
        ]
    },
    resolve: {
        // where to find modules
        modulesDirectories: [
            'node_modules',
            'resources',
            'app'
        ],
        extensions: ['.js', '.jsx', '.json', '']
    },
    plugins: [
        new ExtractTextPlugin('styles.css')
    ]
}