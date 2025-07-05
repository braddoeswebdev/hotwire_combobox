module HotwireCombobox::Component::Associations
  private
    def infer_association_name
      if name.match?(/_\w?id\z/)
        name.sub(/_\w?id\z/, "")
      end
    end

    def associated_object
      @associated_object ||= if association_exists?
        form_object&.public_send association_name
      end
    end

    def association_exists?
      association_name && form_object&.respond_to?(association_name)
    end
end
