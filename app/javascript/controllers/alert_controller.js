import { Controller } from "@hotwired/stimulus"
import Swal from "sweetalert2"

export default class extends Controller {
  static values = { text: String }
// Connects to data-controller="alert"
  connect() {
    Swal.fire({
      title: "Good job!",
      text: this.textValue,
      icon: "success"
    });
  }
}
