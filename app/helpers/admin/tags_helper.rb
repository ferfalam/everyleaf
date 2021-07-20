module Admin::TagsHelper
    def edit_or_create_tag(tag)
        if action_name=="edit"
            admin_tag_path(tag.id)
        elsif action_name=="new"
            admin_tags_path
        end
    end
end
