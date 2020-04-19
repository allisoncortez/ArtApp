module ApplicationHelper
    def has_errors?(this_obj)
        if this_obj.errors
           render partial: "layouts/errors", locals: {object: this_obj}
        end
    end
end
