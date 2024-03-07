import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  // Inform the controller that it has two targets in the form, which are our inputs
  static targets = [ "date", "startTime", "endTime" ]

  connect() {
    flatpickr(this.dateTarget, {
      // "plugins": [new rangePlugin({ input: "#secondRangeInput"})],
      // mode: "range",
      dateFormat: "d-m-Y",
      altInput: true,
      // enableTime: true,
      weekNumbers: true,
      time_24hr: true,
      parseDate: true,
      // inline: true,
      // "plugins": [new confirmDatePlugin({})],
    })
    flatpickr(this.startTimeTarget, {
      altInput: true,
      enableTime: true,
      noCalendar: true,
      time_24hr: true,
      // "plugins": [new confirmDatePlugin({})]
    })
    flatpickr(this.endTimeTarget, {
      altInput: true,
      enableTime: true,
      noCalendar: true,
      time_24hr: true,
      // "plugins": [new confirmDatePlugin({})]
    })
  }
  // connect() {
    // flatpickr(this.dateTarget, {})
    // flatpickr(this.startTimeTarget, {
    //   enableTime: true,
    //   plugins: [new rangePlugin({ input: "#end_time"})]})
    // flatpickr(this.endTimeTarget, {})
    // }
  }
