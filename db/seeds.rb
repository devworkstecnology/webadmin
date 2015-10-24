# Create the first user
user = WebAdmin::User.create!(email: 'admin@email.com',
                           password: 'pwd12345',
                           password_confirmation: 'pwd12345')

# Add permissions
WebAdmin::Permission.create!([
  { user: user, model: 'web_admin/album',         permission_type: 'access' },
  { user: user, model: 'web_admin/event',         permission_type: 'access' },
  { user: user, model: 'web_admin/image',         permission_type: 'access' },
  { user: user, model: 'web_admin/institutional', permission_type: 'access' },
  { user: user, model: 'web_admin/permission',    permission_type: 'access' },
  { user: user, model: 'web_admin/post',          permission_type: 'access' },
  { user: user, model: 'web_admin/user',          permission_type: 'access' },
  { user: user, model: 'web_admin/video',         permission_type: 'access' }
])
