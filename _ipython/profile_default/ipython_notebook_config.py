import inspect
import os
import sys

root = lambda x: os.path.join(os.path.dirname(inspect.currentframe().f_code.co_filename), x)
sys.path.append(root('.'))

def do_config(c):
    c.IPKernelApp.pylab = "inline"

    c.NotebookApp.ip = "*"
    c.NotebookApp.open_browser = False
    c.NotebookApp.port = 8888

    c.NotebookApp.certfile = root('cert.pem')
    c.NotebookApp.password = u"sha1:cd51c7528f1a:0be96ea5f99cc9930f75b0490611864e5234767e"

    c.NotebookApp.notebook_manager_class = "ipython_notebook_config.GitNotebookManager"
