class WebAdmin::PermissionType < EnumerateIt::Base
  associate_values(
    :deny, :read, :modify, :access
  )
end
