# gitlab
gitlab self host install

## CLI must know
```bash
#Initial root password file, for at least 24 hours. For security reasons, after 24 hours, this file is automatically removed by the first gitlab-ctl reconfigure .
$cat /etc/gitlab/initial_root_password
# Edit configuration file
$/etc/gitlab/gitlab.rb
# Compile new config
$sudo gitlab-ctl reconfigure
# Check Logs
$sudo gitlab-ctl tail
#
```

## letsencrypts Enable
```
$nano /etc/gitlab/gitlab.rb
letsencrypt['enable'] = true
 letsencrypt['contact_emails'] = ['admin@example.com'] # This should be an array of email addresses to add as contacts
# letsencrypt['group'] = 'root'
# letsencrypt['key_size'] = 2048
# letsencrypt['owner'] = 'root'
# letsencrypt['wwwroot'] = '/var/opt/gitlab/nginx/www'
# See http://docs.gitlab.com/omnibus/settings/ssl.html#automatic-renewal for more on these sesttings
 letsencrypt['auto_renew'] = true
 letsencrypt['auto_renew_hour'] = 3
# letsencrypt['auto_renew_minute'] = nil # Should be a number or cron expression, if specified.
 letsencrypt['auto_renew_day_of_month'] = "*/7"
# letsencrypt['auto_renew_log_directory'] = '/var/log/gitlab/lets-encrypt'
# letsencrypt['alt_names'] = []
```