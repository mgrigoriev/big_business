class Filter {
  constructor() {
    // Selectors
    this.filterOptionsWrapperSelector = '.js-filter__options-wrapper';
    this.filterOptionsSelector = '.js-clients__filter-option';
    this.resetLinkSelector = '.js-filter__reset-link';

    // Bind 'this'
    this.init = this.init.bind(this);
    this.redraw = this.redraw.bind(this);
    this.resetFilter = this.resetFilter.bind(this);
    this.debounce = this.debounce.bind(this);
  }

  init() {
    $(document).on('click', this.resetLinkSelector, this.resetFilter);
    $(document).on('paste', this.filterOptionsSelector, this.redraw);

    if (App.env == 'test') {
      $(document).on('keyup', this.filterOptionsSelector, this.redraw);
    } else {
      $(document).on('keyup', this.filterOptionsSelector, this.debounce(this.redraw, 400));
    }
  }

  redraw() {
    const dataTable = $('.dataTable').DataTable();
    dataTable.draw();

    this.toggleFilterHighlight();
  }

  resetFilter(event) {
    event.preventDefault();

    $(this.filterOptionsSelector).val('');
    this.redraw();
  }

  toggleFilterHighlight() {
    let filterIsActive = false;

    $(this.filterOptionsSelector).each(function toggleOptionsHighlight() {
      const filterOptionSelector = $(this);

      if ($(filterOptionSelector).val().length > 0) {
        $(filterOptionSelector).addClass('filter__option--active');
        filterIsActive = true;
      } else {
        $(filterOptionSelector).removeClass('filter__option--active');
      }
    });

    if (filterIsActive) {
      $(this.filterOptionsWrapperSelector).addClass('filter__options-wrapper--active');
      $('.js-datatable').addClass('js-datatable--filtered');
    } else {
      $(this.filterOptionsWrapperSelector).removeClass('filter__options-wrapper--active');
      $('.js-datatable').removeClass('js-datatable--filtered');
    }
  }

  debounce(f, ms) {
    let isCooldown = false;

    return function() {
      if (isCooldown) return;

      f.apply(this, arguments);
      isCooldown = true;
      setTimeout(() => isCooldown = false, ms);
    }
  }
}

const filter = new Filter();
filter.init();
