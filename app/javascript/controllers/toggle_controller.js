import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["togglableElement"]
  fire() {
    this.togglableElementTarget.classList.toggle("d-none");
    this.toggleButtonText();
  }
  toggleButtonText() {
    const button = this.element.querySelector("button");
    const buttonText = this.togglableElementTarget.classList.contains("d-none") ? "Make a Reservation" : "Cancel this Booking";

    button.textContent = buttonText;
    button.classList.toggle("btn-danger", buttonText === "Cancel this Booking");
  }
}
