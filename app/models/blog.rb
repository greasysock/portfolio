class Blog < ApplicationRecord
    
    enum status: {
        draft: 0,
        published: 1
    }

    validates_presence_of :title, :body

    belongs_to :topic, class_name: "Topic", optional: true
    has_many :comments, dependent: :destroy

    extend FriendlyId
    friendly_id :title, use: :slugged

    # Scopes
    scope :published, ->{ where(status: :published) }
    scope :newest, -> { order( 'created_at desc' ) }

end