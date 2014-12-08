class AdminWeb::UserType < EnumerateIt::Base
  associate_values(
    :admin => 1,
    :convencional => 2
  )
end
