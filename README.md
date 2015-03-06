linux setup
===========

setup environment and core software on a linux node

run these commands on a new node:

<pre><code>sudo apt-get install -y git-core
git clone git@github.com:yahyavi/linux-setup.git
./linux-setup/setup.sh</code></pre>

a very good source on solarizing color scheme: http://randomartifacts.blogspot.com/2012/10/a-proper-cygwin-environment.html

note
----

If setting up a non-login system (normal ubuntu machine), add this line to .bashrc_custom
<pre><code>[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh # This loads NVM</code></pre>
