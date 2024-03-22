import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["welcome"];

    connect() {

      setTimeout(() => {
        this.hideWelcomeContainer();
      }, 5000);
    }

    hideWelcomeContainer() {
      this.welcomeTarget.classList.add("d-none");
    }
  }
