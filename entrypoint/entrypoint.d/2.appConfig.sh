#!/usr/bin/bash

sed -i -e "s|DOMAIN\s*=\s*'example.com'|DOMAIN = '$DOMAIN'|g" /var/www/modern-paste/app/config.py
sed -i -e "s|DEFAULT_HTTPS\s*=\s*True|DEFAULT_HTTPS = $DEFAULT_HTTPs|g" /var/www/modern-paste/app/config.py
sed -i -e "s|USE_ENCRYPTED_IDS\s*=\s*False|USE_ENCRYPTED_IDS = $USE_ENCRYPTED_IDS|g" /var/www/modern-paste/app/config.py
sed -i -e "s|ENABLE_PASTE_ATTACHMENTS\s*=\s*True|ENABLE_PASTE_ATTACHMENTS = $ENABLE_PASTE_ATTACHMENTs|g" /var/www/modern-paste/app/config.py
sed -i -e "s|MAX_ATTACHMENT_SIZE\s*=\s*0|MAX_ATTACHMENT_SIZE = $MAX_ATTACHMENT_SIZE|g" /var/www/modern-paste/app/config.py
sed -i -e "s|ATTACHMENTS_DIR\s*=\s*'/var/www/modern-paste-attachments'|ATTACHMENTS_DIR = '$ATTACHMENTS_DIR'|g" /var/www/modern-paste/app/config.py
sed -i -e "s|DATABASE_HOST\s*=\s*'localhost'|DATABASE_HOST = '$DATABASE_HOST'|g" /var/www/modern-paste/app/config.py
sed -i -e "s|DATABASE_NAME\s*=\s*'modern_paste'|DATABASE_NAME = '$DATABASE_NAME'|g" /var/www/modern-paste/app/config.py
sed -i -e "s|DATABASE_USER\s*=\s*'modern_paste'|DATABASE_USER = '$DATABASE_USER'|g" /var/www/modern-paste/app/config.py
sed -i -e "s|DATABASE_PASSWORD\s*=\s*'U4bV96S7uchYnJv4WK4akKfzdqKhDFLOpfm0XspYkTF7gyJawhmpZnBi1KdAQNPqxqoUbNDZzuxX0LOgyMc2g8B2NS2j2Fib'|DATABASE_PASSWORD = '$DATABASE_PASSWORD'|g" /var/www/modern-paste/app/config.py
sed -i -e "s|ENABLE_USER_REGISTRATION\s*=\s*True|ENABLE_USER_REGISTRATION = $ENABLE_USER_REGISTRATION|g" /var/www/modern-paste/app/config.py
sed -i -e "s|REQUIRE_LOGIN_TO_PASTE\s*=\s*False|REQUIRE_LOGIN_TO_PASTE = $REQUIRE_LOGIN_TO_PASTE|g" /var/www/modern-paste/app/config.py
sed -i -e "s|FLASK_SECRET_KEY|#FLASK_SECRET_KEY|g" /var/www/modern-paste/app/config.py
