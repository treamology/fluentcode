from subprocess import run
import sys, os

# run('export DB_RESTORE=' + sys.argv[1], shell=True)
os.environ['DB_RESTORE'] = sys.argv[1]
run(['docker-compose', '-f', 'compose-common.yml', '-f', 'docker-compose.yml', 'up', '-d', 'db'],)
run(['docker-compose', '-f', 'compose-common.yml', '-f', 'docker-compose.yml', 'exec', 'db', 'pg_restore', '-d', 'ocdev', '-U', 'postgres', '-c', '/restore.sql'])
run(['docker-compose', '-f', 'compose-common.yml', '-f', 'docker-compose.yml', 'stop', 'db'])