import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="turbo-modal"
export default class extends Controller {
  connect() {
    this.element.querySelector(".close-modal-button").addEventListener("click", () => {
      this.element.parentElement.removeAttribute("src");
      this.element.remove();
    });

    this.element.querySelector(".submit-and-close-button").addEventListener("click", () => {
      this.element.querySelector("form").submit();
      this.element.parentElement.removeAttribute("src");
      this.element.remove();
    });
  }

  static targets = ["modal"];

  close() {
    this.modalTarget.remove();
  }
}
