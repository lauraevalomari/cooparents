import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="progressbar"
export default class extends Controller {
  // méthode connect permet d'exécuter le code au chargement de la page
  static values = { percentage: Number }
  connect() {
    // console.log("Hello")
  // progressbar.js@1.0.0 version is used
  // Docs: http://progressbarjs.readthedocs.org/en/1.0.0/

    const bar = new ProgressBar.SemiCircle(this.element, {
      strokeWidth: 6,
      color: '#FFEA82',
      trailColor: '#eee',
      trailWidth: 1,
      easing: 'easeInOut',
      duration: 1400,
      svgStyle: null,
      text: {
        value: '',
        alignToBottom: false
      },
      from: {color: '#FFEA82'},
      to: {color: '#ED6A5A'},
      // Set default step function for all animate calls
      step: (state, bar) => {
        bar.path.setAttribute('stroke', state.color);
        var value = this.percentageValue;
        if (value === 0) {
          bar.setText('0');
        } else {
          bar.setText(value);
        }

        bar.text.style.color = state.color;
      }
    });
    bar.text.style.fontFamily = '"Raleway", Helvetica, sans-serif';
    bar.text.style.fontSize = '2rem';

    bar.animate(1.0);  // Number from 0.0 to 1.0
  }
}
