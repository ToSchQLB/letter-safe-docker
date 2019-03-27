#!/bin/bash
sudo docker-compose start db
sudo docker-compose start lettersafe
echo 'update git repo...'
sudo docker-compose exec lettersafe git pull
echo 'update composer...';
sudo docker-compose exec lettersafe php ../composer.phar update
echo 'update db';
sudo docker-compose exec lettersafe php yii migrate --interactive=0
echo 'update complete';