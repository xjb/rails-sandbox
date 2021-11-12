import Rails from "@rails/ujs"

export default class {
  static start() {
    (new this).#setup()
  }

  #setup() {
    Rails.confirm = this.#confirm.bind(this)
  }

  #id = 'confimModal'

  #confirm(message, srcEl) {
    let modalEl = document.getElementById(this.#id)

    if (!modalEl) {
      document.body.insertAdjacentHTML('beforeend', this.#modalHTML)
      modalEl = document.getElementById(this.#id)

      modalEl.querySelector('.btn-primary').addEventListener('click', () => {
        delete srcEl.dataset.confirm
        srcEl.click()
      })

      modalEl.addEventListener('shown.bs.modal', () => {
        modalEl.querySelector('.btn-secondary').focus()
      })
    }

    modalEl.querySelector('.modal-body').textContent = message

    let modal = new bootstrap.Modal(modalEl, { backdrop: 'static' })
    modal.show()

    return false
  }

  #modalHTML = `
<!-- Modal -->
<div class="modal fade" id="${this.#id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
  <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="confimModalLabel">Confirmation</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body"></div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary w-25">Ok</button>
        <button type="button" class="btn btn-secondary w-25" data-bs-dismiss="modal">Cancel</button>
      </div>
    </div>
  </div>
</div>
`
}
