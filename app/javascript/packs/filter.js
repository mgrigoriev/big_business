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
  }

  init() {
    $(document).on('keyup change paste', this.filterOptionsSelector, this.redraw);
    $(document).on('click', this.resetLinkSelector, this.resetFilter);
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
      $(this.filterOptionsWrapperSelector).addClass('filter__options-wrapper--active')
    } else {
      $(this.filterOptionsWrapperSelector).removeClass('filter__options-wrapper--active')
    }
  }
}

const filter = new Filter();
filter.init();
