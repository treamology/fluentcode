from subprocess import run
import sys

run(['export', 'DB_RESTORE=\'' + sys.argv[1] + '\''], shell=True)
run(['docker-compose', 'up', '-d', 'db'])
run(['docker-compose', 'exec', 'db', 'pg_restore', '-d', 'ocdev', '-U', 'postgres', '-c', '/restore.sql'])
run(['docker-compose', 'stop', 'db'])