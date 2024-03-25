import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-calculate-day"
export default class extends Controller {

static targets = [ "date" ]
connect(){
  console.log("Hello")
}


    calculate(event) {
      event.preventDefault()
      const from = this.opening_dateTarget.value
      const date = new Date(from)
      console.log(date)
    }




}
