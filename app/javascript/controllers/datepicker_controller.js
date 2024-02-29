import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
// import rangePlugin from "flatpickrRangePlugin";
// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = [ "bookingDates" ]

  connect() {
    flatpickr(this.bookingDatesTarget, {
      mode: "range",
      dateFormat: "d.m.Y",
    });
  }
}
