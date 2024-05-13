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
#Check all Service of gitlab 
sudo gitlab-ctl status
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

## Connect Mail Server 
```
$ sudo vim /etc/gitlab/gitlab.rb

###! Docs: https://docs.gitlab.com/omnibus/settings/smtp.html
###! **Use smtp instead of sendmail/postfix.**

 gitlab_rails['smtp_enable'] = true
 gitlab_rails['smtp_address'] = "smtp.example.com"
 gitlab_rails['smtp_port'] = 587
 gitlab_rails['smtp_user_name'] = "gitlab@example.com"
 gitlab_rails['smtp_password'] = "xxxx"
 gitlab_rails['smtp_domain'] = "example.com"
 gitlab_rails['smtp_authentication'] = "login"
 gitlab_rails['smtp_enable_starttls_auto'] = true
 #gitlab_rails['smtp_tls'] = false
# gitlab_rails['smtp_pool'] = false

###! **Can be: 'none', 'peer', 'client_once', 'fail_if_no_peer_cert'**
###! Docs: http://api.rubyonrails.org/classes/ActionMailer/Base.html
 gitlab_rails['smtp_openssl_verify_mode'] = 'peer'

# gitlab_rails['smtp_ca_path'] = "/etc/ssl/certs"
# gitlab_rails['smtp_ca_file'] = "/etc/ssl/certs/ca-certificates.crt"

### Email Settings

# gitlab_rails['gitlab_email_enabled'] = true

##! If your SMTP server does not like the default 'From: gitlab@gitlab.example.com'
##! can change the 'From' with this setting.
 gitlab_rails['gitlab_email_from'] = 'gitlab@exampl.com'
# gitlab_rails['gitlab_email_display_name'] = 'Example'
# gitlab_rails['gitlab_email_reply_to'] = 'noreply@example.com'
# gitlab_rails['gitlab_email_subject_suffix'] = ''
# gitlab_rails['gitlab_email_smime_enabled'] = false
# gitlab_rails['gitlab_email_smime_key_file'] = '/etc/gitlab/ssl/gitlab_smime.key'
# gitlab_rails['gitlab_email_smime_cert_file'] = '/etc/gitlab/ssl/gitlab_smime.crt'
# gitlab_rails['gitlab_email_smime_ca_certs_file'] = '/etc/gitlab/ssl/gitlab_smime_cas.crt
```
## Debug
```
$gitlab-rails console
Notify.test_email('issarapong@example.com', 'Message Subject', 'Message Body').deliver_now

```
* Docnt forget add MX& TXT reccord of mail server to dns zone


## About Service in gitlab  
```bash
$sudo gitlab-ctl status
run: alertmanager:
run: crond:
run: gitaly: 
run: gitlab-exporter:
run: gitlab-kas:
run: gitlab-workhorse:
run: logrotate:
run: nginx:
run: node-exporter:
run: postgres-exporter: 
run: postgresql:
run: prometheus:  
run: puma:
run: redis: 
run: redis-exporter:
run: registry:
run: sidekiq:
```  
