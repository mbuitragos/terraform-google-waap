#!/bin/bash

# Copyright 2022 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Variáveis
NGINX_CONF_PATH="/etc/nginx/sites-available/default"
WEB_ROOT="/var/www/html"
CUSTOM_PAGE="custom_page.html"

# Atualiza o sistema
sudo apt update

# Instala o Nginx
sudo apt install nginx -y

# Cria a página personalizada
sudo echo "<html><body><h1>WEB APP VERSION 1</h1><p>Region: us-central1</p></body></html>" | tee $WEB_ROOT/$CUSTOM_PAGE

# Configuração do Nginx
sudo sed -i 's|/var/www/html;|/var/www/html/'$CUSTOM_PAGE';|' $NGINX_CONF_PATH
sudo systemctl restart nginx