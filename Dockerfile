FROM davask/d-apache:2.4-u16.04
MAINTAINER davask <docker@davaskweblimited.com>
LABEL dwl.app.language="php"

ENV DWL_DATE_TIMEZONE Europe/Paris

# Update packages
RUN /bin/bash -c 'apt-get update'
RUN /bin/bash -c 'apt-get install -y php'
RUN /bin/bash -c 'apt-get install -y php-apcu'
RUN /bin/bash -c 'apt-get install -y php-opcache'
RUN /bin/bash -c 'apt-get install -y php-cli'
RUN /bin/bash -c 'apt-get install -y php-curl'
RUN /bin/bash -c 'apt-get install -y php-gd'
RUN /bin/bash -c 'apt-get install -y php-intl'
RUN /bin/bash -c 'apt-get install -y php-json'
RUN /bin/bash -c 'apt-get install -y php-mbstring'
RUN /bin/bash -c 'apt-get install -y php-mcrypt'
RUN /bin/bash -c 'apt-get install -y php-memcached'
RUN /bin/bash -c 'apt-get install -y php-mysql'
RUN /bin/bash -c 'apt-get install -y php-mysqlnd'
RUN /bin/bash -c 'apt-get install -y php-readline'
RUN /bin/bash -c 'apt-get install -y php-xml'
RUN /bin/bash -c 'apt-get install -y php-xsl'
RUN /bin/bash -c 'apt-get install -y libapache2-mod-php'
RUN /bin/bash -c 'apt-get install -y memcached'
# sendmail required to use php mail()
RUN /bin/bash -c 'apt-get install -y sendmail'
RUN /bin/bash -c 'rm -rf /var/lib/apt/lists/*'

# RUN /bin/bash -c 'echo "include(`/etc/mail/tls/starttls.m4\')dnl" >> /etc/mail/sendmail.mc'
# RUN /bin/bash -c 'echo "include(`/etc/mail/tls/starttls.m4\')dnl" >> /etc/mail/submit.mc'
# RUN /bin/bash -c 'sendmailconfig'

# Setup Composer
RUN /bin/bash -c 'curl -sS https://getcomposer.org/installer | php;'
RUN /bin/bash -c 'mv composer.phar /usr/local/bin/composer;'

COPY ./tmp/dwl/php.sh /tmp/dwl/php.sh
COPY ./tmp/dwl/sendmail.sh /tmp/dwl/sendmail.sh
COPY ./tmp/dwl/init.sh /tmp/dwl/init.sh
