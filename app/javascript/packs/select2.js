class BsTooltips {
  static init() {
    $(document).ready(() => {
      $('.select2').select2({
        theme: 'bootstrap'
      });
    });
  }
}

BsTooltips.init();
