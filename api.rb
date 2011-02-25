require 'grape'

require 'xen/instance'
Xen::Instance.populdate

module Xen
  class API < Grape::API
    resources :machines do
      helpers do
        def find(id)
          server = Xen::Instance.find(id)
          error!('404 Not Found', 404) if server.nil?
          server
        end
      end

      get do
        Instance.all.map { |instance| instance.serializable_hash }
      end

      get ':id' do
        find(params[:id])
      end

      post do
        Instance.create(params)
      end

      put ':id/reboot' do
        server = find(params[:id])
        server.reboot

        status(202)

        server
      end

      put ':id/shutdown' do
        server = find(params[:id])
        server.shutdown

        status(202)

        server
      end

      put ':id' do
        server = find(params[:id])
        server.update_attributes(params)
        server
      end

      delete ':id' do
        server = find(params[:id])
        server.destroy
      end
    end
  end
end
