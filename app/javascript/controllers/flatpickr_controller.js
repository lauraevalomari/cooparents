import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";
import "flatpickr/dist/l10n/fr.js"

export default class extends Controller {
  static targets = ["date", "startTime", "endTime"];

  connect() {
    flatpickr(this.dateTarget, {
      dateFormat: "d-m-Y",
      weekNumbers: true,
      time_24hr: true,
      // parseDate: true,
      allowInput: true,
      locale : "fr",

    });

    flatpickr(this.startTimeTarget, {
      enableTime: true,
      noCalendar: true,
      time_24hr: true,
      allowInput: true,
    });

    flatpickr(this.endTimeTarget, {
      enableTime: true,
      noCalendar: true,
      time_24hr: true,
      allowInput: true,
    });
  }
}
