import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="button-disabled"
export default class extends Controller {
  // static targets = ["button"]
  // connect() {
  //   console.log("Hello");
  // }
  disable() {
    this.element.innerText = "Terminée!";
    this.element.disabled = true;
    this.element.status = true;
  }
}
