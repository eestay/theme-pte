#!/bin/bash

# update assets as edxapp user
sudo -H -u edxapp bash << EOF
source /edx/app/edxapp/edxapp_env
cd /edx/app/edxapp/edx-platform
paver i18n_fastgenerate
./manage.py lms compilejsi18n
EOF

# restart lms instance
sudo /edx/bin/supervisorctl restart edxapp:lms
