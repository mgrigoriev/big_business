class Tooltips {
  constructor() {
    this.listenEvents()
  }

  listenEvents() {
    $(document).ready(this.init);
  }

  init() {
    $('[data-toggle="tooltip"]').tooltip();
    $('[data-toggle="popover"]').popover();
  }
}

new Tooltips();
