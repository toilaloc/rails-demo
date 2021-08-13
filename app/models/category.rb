class Category < ApplicationRecord
    has_many :post, dependent: :destroy
    validates :name, 
          :presence => {:message => "Title can't be blank." },
          :uniqueness => {:message => "Title already exists."},
          :length => { :maximum => 100, :message => "Must be less than 100 characters"}
    validates :description, 
          :presence => {:message => "Description can't be blank." },
          :uniqueness => {:message => "Description already exists."},
          :length => { :maximum => 100, :message => "Must be less than 100 characters"}
    validate :number_or_nil

    def is_numeric?(obj) 
        obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
    end

    def number_or_nil
        unless parent_id.nil? || is_numeric?(parent_id)
          errors.add(:parent_id, "Must be integer or not choose #{parent_id.class}")
        end
      end

end
