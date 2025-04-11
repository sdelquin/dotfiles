# https://ipython.readthedocs.io/en/stable/config/options/terminal.html
import os
import random
import sys

import IPython
from IPython.terminal.prompts import Prompts, Token
from prompt_toolkit.application.current import get_app
from prompt_toolkit.key_binding.vi_state import InputMode

ZEN = [
    'Beautiful is better than ugly.',
    'Explicit is better than implicit.',
    'Simple is better than complex.',
    'Complex is better than complicated.',
    'Flat is better than nested.',
    'Sparse is better than dense.',
    'Readability counts.',
    "Special cases aren't special enough to break the rules.",
    'Although practicality beats purity.',
    'Errors should never pass silently.',
    'Unless explicitly silenced.',
    'In the face of ambiguity, refuse the temptation to guess.',
    'There should be one-- and preferably only one --obvious way to do it.',
    "Although that way may not be obvious at first unless you're Dutch.",
    "Now is better than never.",
    "Although never is often better than *right* now.",
    "If the implementation is hard to explain, it's a bad idea.",
    "If the implementation is easy to explain, it may be a good idea.",
    "Namespaces are one honking great idea -- let's do more of those!",
]


class CustomPrompt(Prompts):
    def in_prompt_tokens(self):
        return [(Token.Prompt, '>>> ')]

    def out_prompt_tokens(self, cli=None):
        return [(Token.Prompt, '')]

    def continuation_prompt_tokens(self, cli=None):
        return [(Token.Prompt, '... ')]


def banner1() -> str:
    v = sys.version_info
    pyversion = f'{v.major}.{v.minor}.{v.micro}'
    ipyversion = IPython.__version__
    return f'󰣙 󰫽󰬆󰬁󰫵󰫼󰫻 {pyversion} |  󰫶󰫽󰬆󰬁󰫵󰫼󰫻 {ipyversion}'


def banner2() -> str:
    zen = random.choice(ZEN).rstrip('.')
    return f'"{zen}"\n'


def set_cursor_style(mode):
    # 0 = blinking block, 1 = blinking underline, 2 = steady block, 3 = blinking bar, 5 = steady bar
    styles = {
        'navigation': '\x1b[2 q',  # bloque sólido
        'insert': '\x1b[5 q',  # línea fina
    }
    print(styles[mode], end='', flush=True)


def on_mode_change(event):
    app = get_app()
    mode = app.vi_state.input_mode
    if mode == InputMode.INSERT:
        set_cursor_style('insert')
    else:
        set_cursor_style('navigation')


def load_ipython_extension(ipython):
    app = get_app()
    app.vi_state.input_mode = InputMode.NAVIGATION
    app.vi_state.on_mode_changed += on_mode_change
    set_cursor_style('navigation')


c = get_config()  # type: ignore # noqa: F821

c.TerminalInteractiveShell.prompts_class = CustomPrompt
c.InteractiveShellApp.extensions = ['autoreload', '__main__']
c.InteractiveShellApp.exec_lines = ['autoreload 2']
c.TerminalInteractiveShell.editing_mode = 'vi'
c.TerminalInteractiveShell.timeoutlen = 0.2
if os.environ.get('TEACHING'):
    c.HistoryManager.hist_file = ':memory:'
c.TerminalInteractiveShell.confirm_exit = False
c.TerminalInteractiveShell.banner1 = banner1()
c.TerminalInteractiveShell.banner2 = banner2()
