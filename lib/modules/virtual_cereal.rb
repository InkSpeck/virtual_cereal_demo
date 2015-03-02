module VirtualCereal
  def create_virtual_attributes_for_serialized_column(column_name, v_attributes)
    v_attributes.each do |key|
      getter_name = "#{column_name}_#{key}"
      setter_name = "#{column_name}_#{key}="
      self.class.send(:define_method, getter_name) do
        if self.send(column_name)
          self.send(column_name)[key] ? self.send(column_name)[key] : [""]
        else
          [""]
        end
      end
      self.class.send(:define_method, setter_name) do |values|
        if self.send(column_name)
          self.send(column_name)[key] = values
        else
          self.send("#{column_name}=",{})
          self.send(column_name)[key] = values
        end
      end
    end
  end
end
