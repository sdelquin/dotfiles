# ipython -i ~/<path>/<to>/<here>/ipython-startup.py
# export PYTHONSTARTUP=~/<path>/<to>/<here>/ipython-startup.py

from IPython.terminal.prompts import Prompts
from IPython import get_ipython
from pygments.token import Token


class MyPrompt(Prompts):
    def in_prompt_tokens(self, cli=None):
        return [(Token.Prompt, '>>> ')]

    def out_prompt_tokens(self, cli=None):
        return [(Token.Prompt, '')]

    def continuation_prompt_tokens(self, cli=None):
        return [(Token.Prompt, '... ')]


if ip := get_ipython():
    ip.prompts = MyPrompt(ip)
    ip.run_line_magic('reload_ext', 'autoreload')
    ip.run_line_magic('autoreload', '3')
    ip.pt_app.auto_suggest = None
    ip.editing_mode = 'vi'
