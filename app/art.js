import processingSrc from 'file!processing-js/processing.js'
import main from 'file!./main.pde'
import RecursiveCircles from 'file!components/RecursiveCircles.pde'
import Eye from 'file!components/Eye.pde'
import ColorTypewriter from 'file!components/ColorTypewriter.pde'

export default {
    init(){

        const processing = document.createElement('script')
        processing.setAttribute('src', 'https://cdnjs.cloudflare.com/ajax/libs/processing.js/1.4.16/processing.js')
        
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

            const sources = [main, RecursiveCircles, Eye, ColorTypewriter]
            canvas.setAttribute('data-processing-sources', sources.join(' '))

            // reload Processing to catch changes
            Processing.reload()
        })

        document.body.appendChild(processing)
    }
}

