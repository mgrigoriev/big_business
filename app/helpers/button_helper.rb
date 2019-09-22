# frozen_string_literal: true

module ButtonHelper
  def edit_button(path)
    link_to path do
      tag.button(
        tag.i(class: 'fas fa-pencil-alt'),
        class: 'btn btn-outline-primary',
        title: 'Edit',
        data: { toggle: 'tooltip' }
      )
    end
  end

  def destroy_button(path)
    link_to path, method: :delete, data: { confirm: 'Are you sure?' } do
      tag.button(
        tag.i(class: 'far fa-trash-alt'),
        class: 'btn btn-outline-primary',
        title: 'Delete',
        data: { toggle: 'tooltip' }
      )
    end
  end
end
