// setup for processing.js

import processingSrc from 'file!processing-js/processing.js'

// .pde files to inject
import main from 'file!./main.pde'
import GameOfLife from 'file!components/GameOfLife.pde'

export default {
    init(){

        const processing = document.createElement('script')
        processing.setAttribute('src', processingSrc)
        
        processing.addEventListener('load', () => {
            // set up processing sources
            const canvas = document.getElementById('playground')

            // manually trigger onkeydown for 'backspace'
            // override default action of going to previous site
            canvas.addEventListener('keydown', (e)=>{
                if(e.keyCode == 8){
                    e.preventDefault();
                    const pInstance = Processing.getInstanceById('playground')
                    pInstance.key = new Char(pInstance.CODED)
                    pInstance.keyCode = new Char(pInstance.DELETE)
                    pInstance.keyPressed()
                }
            })

            // list of .pde files to include
            const sources = [main, GameOfLife];
            canvas.setAttribute('data-processing-sources', sources.join(' '))

            // reload Processing to catch changes
            Processing.reload()
        })

        // append processing script
        document.body.appendChild(processing)
    }
}

