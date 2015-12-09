import processingSrc from 'file!processing-js/processing.js'
import scriptSrc from 'file!./test.pde'

export default {
    init(){

        const processing = document.createElement('script')
        processing.setAttribute('src', 'https://cdnjs.cloudflare.com/ajax/libs/processing.js/1.4.16/processing.js')
        
        processing.addEventListener('load', () => {
            // set up processing sources
            const canvas = document.getElementById('playground')
            canvas.setAttribute('data-processing-sources', scriptSrc)

            // reload Processing to catch changes
            Processing.reload()
        })

        document.body.appendChild(processing)
    }
}

