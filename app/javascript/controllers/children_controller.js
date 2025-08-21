import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["count", "fields"]

  update() {
    const count = parseInt(this.countTarget.value || 0, 10)
    this.fieldsTarget.innerHTML = ""

    for (let i = 0; i < count; i++) {
      const wrapper = document.createElement("div")
      wrapper.classList.add("mb-2")

      const label = document.createElement("label")
      label.textContent = `子ども${i+1}人目の年齢`
      label.classList.add("form-label")

      const input = document.createElement("input")
      input.type = "number"
      input.name = "children_ages[]"
      input.min = "0"
      input.max = "100"
      input.placeholder = "例: 5"
      input.classList.add("form-control")

      wrapper.appendChild(label)
      wrapper.appendChild(input)
      this.fieldsTarget.appendChild(wrapper)
    }
  }
}
