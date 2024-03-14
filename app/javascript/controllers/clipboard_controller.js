import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clipboard"
export default class extends Controller {
  static targets = [ "source" ]

  connect() {
    console.log("Clipboard copy is enable!")
  }

  copy(event) {
    event.preventDefault();
    navigator.clipboard.writeText(this.sourceTarget.href);
  }
}
