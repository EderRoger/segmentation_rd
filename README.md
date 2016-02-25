#Segmentation - RD#

##Heroku depoly##

* https://segmentationrd.herokuapp.com

##Requirements to run localy with Ansible provision##

* Ansible
* Vagrant
* VirtualBox

##Run now!##

* clone the project ``git clone git@github.com:EderRoger/segmentation_rd.git``
* ``cd segmentation_rd``
* ``vagrant up``
* copy id_rsa.pub to vagrant authorized_keys  ``ssh-copy-id vagrant@192.168.33.10`` (password = vagrant)
* run ansible provision ``ansible-playbook -i production -u vagrant server.yml -vvvv``
* copy your public key ``cat ~/.ssh/id_rsa.pub``
* now you must add your public key to root user ``vagrant ssh`` then ``sudo su root`` now edit authorized keys ``sudo vim ~/.ssh/authorized_keys`` and add your public key
* run ansible provision with root  ``ansible-playbook -i production -u root root.yml -vvvv``


##Now you can check if your server is provisioned##

* ``vagrant ssh`` and  ``cd /vagrant/segmentation`` execute bundle command ``bundle install`` 
* run ``sudo rake db:migrate`` and start the server ``sh start.sh``
* open your browser and check http://localhost:3000


##Requirements to run with your environment##

* ruby
* postgres

##Run now##

* clone the project ``git clone git@github.com:EderRoger/segmentation_rd.git``
* ``cd segmentation_rd``
* execute bundle command ``bundle install`` and start the server ``sh start.sh`` (if appears bundle  error remove Gemfile.lock and re-run ``bundle install``)
* open your browser and check http://localhost:3000

##Considerations##

* First I made a project using Rails to forms views (simple_form) but latter i realized to get a 100% of requirements I 
  need it AngularJS but my time is just tied and this cannot be made.
* I created a simple CRUD contact and a QueryBuilder form to make dinamic filters
* The agregator 'OR' and 'AND' both be missing, because the time will be short :( sorry
* the reason to created a stack using ansible was just to automate infrastructure. (DevOps culture :) )
