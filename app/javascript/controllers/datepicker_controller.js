import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
// import rangePlugin from "flatpickrRangePlugin";
// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = [ "startTime", "endTime" ]

  connect() {
    flatpickr(this.startTimeTarget, {
      mode: "range"
    })

  }
  
}
