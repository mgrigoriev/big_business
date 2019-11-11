# frozen_string_literal: true

module ButtonHelper
  def manage_buttons_for(resource, edit_path: '', destroy_path: '')
    edit_button = edit_button_for(resource, path: edit_path)
    destroy_button = destroy_button_for(resource, path: destroy_path)

    tag.span("#{edit_button} #{destroy_button}".html_safe, class: 'text-nowrap')
  end

  def edit_button_for(resource, path: path)
    return if path.blank?

    link_to path do
      tag.button(
        tag.i(class: 'fas fa-pencil-alt'),
        id: "edit-#{resource.id}",
        class: 'btn btn-outline-primary',
        title: 'Edit',
        data: { toggle: 'tooltip' }
      )
    end
  end

  def destroy_button_for(resource, path: path)
    return if path.blank?

    link_to path, method: :delete, data: { confirm: 'Are you sure?' } do
      tag.button(
        tag.i(class: 'far fa-trash-alt'),
        id: "delete-#{resource.id}",
        class: 'btn btn-outline-primary',
        title: 'Delete',
        data: { toggle: 'tooltip' }
      )
    end
  end
end
