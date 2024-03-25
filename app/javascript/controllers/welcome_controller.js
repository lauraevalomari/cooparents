import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["welcome", "devise"];

    connect() {

      setTimeout(() => {
        this.hideWelcomeContainer();
        this.displayDeviseContainer();
      }, 5000);
    }

    hideWelcomeContainer() {
      this.welcomeTarget.classList.add("d-none");
    }

    displayDeviseContainer() {
      this.deviseTarget.classList.remove("d-none");
    }
  }
