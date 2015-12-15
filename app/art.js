import processingSrc from 'file!processing-js/processing.js'
import main from 'file!./main.pde'
import Intersections from 'file!components/Intersections.pde'
import Util from 'file!components/Util.pde'

export default {
    init(){

        const processing = document.createElement('script')
        processing.setAttribute('src', processingSrc)
        
        processing.addEventListener('load', () => {
            // set up processing sources
            const canvas = document.getElementById('playground')

            // processing instance

            canvas.addEventListener('keydown', (e)=>{
                if(e.keyCode == 8){
                    e.preventDefault();
                    const pInstance = Processing.getInstanceById('playground')
                    pInstance.key = new Char(pInstance.CODED)
                    pInstance.keyCode = new Char(pInstance.DELETE)
                    pInstance.keyPressed()
                }
            })

            const sources = [main, Intersections, Util]
            canvas.setAttribute('data-processing-sources', sources.join(' '))

            // reload Processing to catch changes
            Processing.reload()
        })

        document.body.appendChild(processing)
    }
}

