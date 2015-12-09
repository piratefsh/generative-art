import processingSrc from 'file!processing-js/processing.js'

function init(){
    // include processing
    const processing = document.createElement('script')
    processing.src = processingSrc
    document.body.appendChild(processing)
}

init()