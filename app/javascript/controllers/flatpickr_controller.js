import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  static targets = ["date", "startTime", "endTime"];

  connect() {
    this.initializeFlatpickr(this.dateTarget);
    this.initializeFlatpickr(this.startTimeTarget);
    this.initializeFlatpickr(this.endTimeTarget);
  }

  initializeFlatpickr(target) {
    flatpickr(target, {
      // Add Flatpickr options here
      dateFormat: "Y-m-d",
      enableTime: true, // If you want to enable time selection
      // Add other options as needed
    });
  }
}
