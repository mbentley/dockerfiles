import os
import sys

sys.path.append('/var/www/example/application')

os.environ['PYTHON_EGG_CACHE'] = '/var/www/example/.python-egg'

def application(environ, start_response):
    status = '200 OK'
    output = 'Hello World!'

    response_headers = [('Content-type', 'text/plain'),
                    ('Content-Length', str(len(output)))]
    start_response(status, response_headers)

    return [output]
