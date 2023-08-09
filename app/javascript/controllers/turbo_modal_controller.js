import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  hideModal() {
    const referringUrl = this.element.closest("[data-controller='turbo-modal']").getAttribute("data-referring-url");
    this.element.parentElement.removeAttribute("src");
    this.element.remove();
    
    if (referringUrl) {
      window.location.href = referringUrl;
    }
  }
}
