class Blog < ApplicationRecord
    
    enum status: {
        draft: 0,
        published: 1
    }

    # Sets default scope ordered newest first.
    default_scope ->{ order('created_at desc') }
    validates_presence_of :title, :body

    belongs_to :topic, class_name: "Topic", optional: true

    extend FriendlyId
    friendly_id :title, use: :slugged

    def self.special_blogs
        limit(2)
    end
end