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

      if self.status.is_closed? or self.status_id == 14 or self.status_id == 3 or self.status_id == 5 or self.status_id == 11 # fermé, closed , resolu / resolu et testé
            self.assigned_to_id = self.author_id
      end
    end
  end
  end
end
