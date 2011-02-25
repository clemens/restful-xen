require 'grape'

require 'xen/server'
require 'xen/instance'

Xen::Instance.class_eval do
  def serializable_hash
    Hash[*[:dom_id, :name, :memory, :vcpus, :state, :time].map { |attribute| [attribute, send(attribute)] }.flatten]
  end
end

module Xen
  class API < Grape::API
    resources :machines do
      helpers do
        def find(name)
          instance = Xen::Instance.find_by_name(name)
          error!('404 Not Found', 404) if instance.nil?
          instance
        end
      end

      get do
        Instance.all.map { |instance| instance.serializable_hash }
      end

      get ':name' do
        find(params[:name])
      end

      post do
        Instance.create(params)
      end

      put ':name/start' do
        Xen::Instance.start(params[:name])
      end

      put ':name/reboot' do
        instance = find(params[:name])
        instance.reboot

        status(202)

        instance
      end

      put ':name/shutdown' do
        instance = find(params[:name])
        instance.shutdown

        status(202)

        instance
      end

      # put ':name' do
      #   instance = find(params[:name])
      #   instance.update_attributes(params)
      #   instance
      # end

      delete ':name' do
        instance = find(params[:name])
        instance.destroy
        instance
      end
    end
  end
end
