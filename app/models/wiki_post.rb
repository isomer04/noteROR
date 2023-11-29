class WikiPost < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    acts_as_paranoid


    scope :contributors, -> { pluck(:author).uniq}
    scope :sort_by_created, -> {order(created_at: :desc)}

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
