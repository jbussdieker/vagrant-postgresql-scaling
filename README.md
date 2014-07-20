# Vagrant PostgreSQL Scaling

Simple hot spare scaling solution using PostgreSQL and fully puppetized setup.

## Usage

Bring up database servers one after another.

`````shell
vagrant up db1
vagrant up db2
`````

Do some stuff on db1 and watch it all magically appear on db2.
