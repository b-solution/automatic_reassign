require_dependency 'issue'


module  AutomaticReassign
  module  Patches
  module IssuePatch
    def self.included(base)
      base.extend(ClassMethods)

      base.send(:include, InstanceMethods)

      base.class_eval do
        before_save :update_assign
      end
    end
  end

  module ClassMethods
  end

  module InstanceMethods
    def update_assign

      self.assigned_to_id = self.author_id if self.status.is_closed? 
      end
    end
  end
  end
end
