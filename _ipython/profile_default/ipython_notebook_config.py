import inspect
import os
import sys
import subprocess

from IPython.frontend.html.notebook.filenbmanager import FileNotebookManager

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

class GitNotebookManager(FileNotebookManager):
    def _git(self, *args, **kwargs):
        stdout = subprocess.PIPE if kwargs.get("capture") else sys.stdout
        p = subprocess.Popen(("git", ) + args, stdin=sys.stdin, stdout=stdout, stderr=sys.stderr)
        p.wait()

        if kwargs.get("capture"):
            return p.stdout.read()

    def write_notebook_object(self, nb, notebook_id=None):
        old_name = self.mapping[notebook_id] if notebook_id in self.mapping else None

        notebook_id = super(GitNotebookManager, self).write_notebook_object(nb, notebook_id)

        new_path = self.get_path_by_name(nb.metadata.name)
        old_path = self.get_path_by_name(old_name or self.mapping[notebook_id])

        if old_path != new_path:  # rename the file if its name changed
            self._git("rm", "-f", old_path)

        self._git("add", new_path)
        if self._git("status", "--untracked=no", "--porcelain", capture=True):  # check if there's anything to commit
            self._git("commit", "-m", "IPython: saving a new version of '%s'" % nb.metadata.name)

        return notebook_id

# I am not proud of this, but it is a necessary evil
if "get_config" in locals():
    do_config(get_config())
