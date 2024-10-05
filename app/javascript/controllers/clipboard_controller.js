import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static values = {
    content: String
  }

  async copy() {
    async function writeClipboardText(text, element) {
      const originalText = element.textContent;

      try {
        await navigator.clipboard.writeText(text);
        element.textContent = "Copied!"
        setTimeout(() => { element.textContent = originalText }, 1000)
      } catch (error) {
        console.error(error.message);
        alert("Failed to copy to clipboard")
      }
    }

    await writeClipboardText(this.contentValue, this.element)
  }
}
