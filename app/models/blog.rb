class Blog < ApplicationRecord
    
    enum status: {
        draft: 0,
        published: 1
    }

    validates_presence_of :title, :body

    belongs_to :topic, class_name: "Topic", optional: true

    extend FriendlyId
    friendly_id :title, use: :slugged
end