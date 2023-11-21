class WikiPost < ApplicationRecord
    has_one_attached :image

    scope :contributors, -> { pluck(:author).uniq}

    # Soft delete method
    def soft_delete
        update(deleted_at: Time.now)
    end

    # Restore method
    def restore
        update(deleted_at: nil)
    end

    # Default scope
    default_scope { where(deleted_at: nil) }
end
