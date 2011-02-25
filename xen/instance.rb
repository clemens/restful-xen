# for testing :)
# module Xen
#   class Instance
#     @@instances = []
# 
#     attr_accessor :dom_id, :name, :memory, :vcpus, :size, :state
# 
#     class << self
#       def populdate
#         @@instances = [
#           Instance.new(
#             :dom_id => 1,
#             :name   => 'Test Instance 1',
#             :memory => '1024M',
#             :size   => '500G',
#             :vcpus  => 1,
#             :state  => 'running'
#           ),
#           Instance.new(
#             :dom_id => 2,
#             :name   => 'Test Instance 2',
#             :memory => '2054M',
#             :size   => '750G',
#             :vcpus  => 4,
#             :state  => 'running'
#           )
#         ]
#       end
# 
#       def all
#         @@instances
#       end
# 
#       def find(id)
#         @@instances.detect { |instance| instance.id.to_i == id.to_i }
#       end
# 
#       def create(attributes = {})
#         next_id = all.map { |instance| instance.id }.max.to_i + 1
# 
#         server = new(
#           :id     => next_id,
#           :name   => attributes[:name],
#           :memory => attributes[:memory],
#           :hdd    => attributes[:hdd],
#           :cpus   => attributes[:cpus],
#           :status => 'running'
#         )
# 
#         @@instances << server
# 
#         server
#       end
#     end
# 
#     def initialize(attributes = {})
#       @id, @name, @memory, @hdd, @cpus = attributes.values_at(:id, :name, :memory, :hdd, :cpus)
#       @status = attributes[:status] || 'starting'
#     end
# 
#     def update_attributes(attributes = {})
#       @name   = attributes[:name]   if attributes[:name]
#       @memory = attributes[:memory] if attributes[:memory]
#       @hdd    = attributes[:hdd]    if attributes[:hdd]
#       @cpus   = attributes[:name]   if attributes[:cpus]
# 
#       true
#     end
# 
#     def destroy
#       @@instances.delete(self)
#     end
# 
#     def reboot
#       @status = 'rebooting'
#     end
# 
#     def shutdown
#       @status = 'shutting down'
#     end
# 
#     def serializable_hash
#       Hash[*[:id, :name, :memory, :hdd, :cpus, :status].map { |attribute| [attribute, send(attribute)] }.flatten]
#     end
#   end
# end
