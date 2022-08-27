# Домашнее задание "Введение в виртуализацию. Типы и функции гипервизоров. Обзор рынка вендоров и областей применения"


### Задача №1

Опишите своими словами основные преимущества применения на практике IaaC паттернов.

* Удешевление и скорость вывода продукта на рынок
* Снижение сроков разработки и тестирования програмных продуктов
* Более качественная разработка продукта за счёт многократного прохождения тестирования в процессе разработки.
* Снижение нагрузки на администрирование ресурсов за счёт однократного повторения многих операций на любое колличество серверов.

Какой из принципов IaaC является основополагающим?

* Идемпотентность- многократное повторение одной и той же итерации приводящей к одному успешному результату.

### Задача №2

Чем Ansible выгодно отличается от других систем управление конфигурациями?

* Своей возможностью работать по протоколу SSH. Что ускоряет развертывание серверов и передачу нужных инструкций.
* Работает без установки на хостовые машины агента.
* Имеет полную информацию и описание своих фенкций и возможностей. Работает на разметке YAML.

Какой, на ваш взгляд, метод работы систем конфигурации более надёжный push или pull?

* Я думаю что у каждого метода есть определённые недостатки, но лично моё мнение что метод push более надёжен так как сервер сам инициирует отправку конфигов хостам исключая лишнюю нагрузку на сервер. В то время как метод pull может уменьшить срок доставки инструкций хостам, так как колличество распостраняемых конфигов в один момент времени увеличивается. Но тут нужен мощный сервер способный справится с нагрузкой.

### Задача №3

Установить на личный компьютер:

VirtualBox
Vagrant
Ansible

Решение:

* Графический интерфейс VirtualBox

  Версия 6.1.26 r145957 (Qt5.6.2)

* C:\Users\SAM>vagrant -v

  Vagrant 2.2.19

* vagrant@vagrant:~$ ansible --version

  ansible 2.9.6
  
  config file = /etc/ansible/ansible.cfg
  
  configured module search path = ['/home/vagrant/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  
  ansible python module location = /usr/lib/python3/dist-packages/ansible
  
  executable location = /usr/bin/ansible
  
  python version = 3.8.10 (default, Nov 26 2021, 20:14:08) [GCC 9.3.0]
  
### Задача №4

* К сожалению установить не удалось. Получил следующий вывод. Якобы установить Ansible на Windows Vagrant нельзя.

C:\Users\SAM\vagrant_conf>vagrant up
Bringing machine 'server1.netology' up with 'virtualbox' provider...
==> server1.netology: Checking if box 'bento/ubuntu-20.04' version '202112.19.0' is up to date...
==> server1.netology: Setting the name of the VM: server1.netology
==> server1.netology: Clearing any previously set network interfaces...
==> server1.netology: Preparing network interfaces based on configuration...
    server1.netology: Adapter 1: nat
    server1.netology: Adapter 2: hostonly
==> server1.netology: Forwarding ports...
    server1.netology: 19999 (guest) => 19999 (host) (adapter 1)
    server1.netology: 22 (guest) => 20011 (host) (adapter 1)
    server1.netology: 22 (guest) => 2222 (host) (adapter 1)
==> server1.netology: Running 'pre-boot' VM customizations...
==> server1.netology: Booting VM...
==> server1.netology: Waiting for machine to boot. This may take a few minutes...
    server1.netology: SSH address: 127.0.0.1:2222
    server1.netology: SSH username: vagrant
    server1.netology: SSH auth method: private key
    server1.netology: Warning: Connection reset. Retrying...
    server1.netology: Warning: Connection aborted. Retrying...
    server1.netology: Warning: Remote connection disconnect. Retrying...
    server1.netology:
    server1.netology: Vagrant insecure key detected. Vagrant will automatically replace
    server1.netology: this with a newly generated keypair for better security.
    server1.netology:
    server1.netology: Inserting generated public key within guest...
    server1.netology: Removing insecure key from the guest if it's present...
    server1.netology: Key inserted! Disconnecting and reconnecting using new SSH key...
==> server1.netology: Machine booted and ready!
==> server1.netology: Checking for guest additions in VM...
==> server1.netology: Setting hostname...
==> server1.netology: Configuring and enabling network interfaces...
==> server1.netology: Mounting shared folders...
    server1.netology: /vagrant => C:/Users/SAM/vagrant_conf
==> server1.netology: Running provisioner: ansible...
Windows is not officially supported for the Ansible Control Machine.
Please check https://docs.ansible.com/intro_installation.html#control-machine-requirements
`playbook` does not exist on the host: C:/Users/SAM/ansible/provision.yml

C:\Users\SAM\vagrant_conf>
  
  
  
