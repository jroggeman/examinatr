ActiveSupport.on_load(:action_controller) do
  ActiveModelSerializers.config.jsonapi_include_toplevel_object = true
  ActiveModelSerializers.config.adapter = :json_api
end
