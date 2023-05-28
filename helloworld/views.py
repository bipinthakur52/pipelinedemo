from django.http import HttpResponse
import os
def index(request):
    return HttpResponse("Hello, pipelinebipinthakur with testing"+os.environ.get('LAMBDA_SQL_ENGINE'))
