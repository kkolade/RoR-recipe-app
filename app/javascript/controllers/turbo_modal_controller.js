import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.querySelector(".close-modal-button").addEventListener("click", () => {
      this.closeModal();
    });

    this.element.querySelector(".submit-and-close-button").addEventListener("click", (event) => {
      event.preventDefault();
      
      this.submitFormAndRedirect();
    });
  }

  closeModal() {
    this.element.parentElement.removeAttribute("src");
    this.element.remove();
  }

  submitFormAndRedirect() {
    const form = this.element.querySelector("form");
    form.submit();

    const recipeId = form.querySelector("input[name='recipe_id']").value;
    const inventoryId = form.querySelector("select[name='inventory_id']").value;
    
    const url = `/shopping_lists?recipe_id=${recipeId}&inventory_id=${inventoryId}`;
    window.location.href = url;
  }
}
