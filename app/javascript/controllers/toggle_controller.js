import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ['form']
  connect() {
    console.log(this.formTarget)
  }

  toggleForm(event) {
    event.preventDefault()
    this.formTarget.classList.toggle('d-none')
  }
}
