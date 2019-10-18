class BsTooltips {
  static init() {
    $(document).ready(() => {
      $('[data-toggle="tooltip"]').tooltip();
      $('[data-toggle="popover"]').popover();
    });
  }
}

BsTooltips.init();
