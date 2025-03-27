import random
import sys

import IPython
from IPython.terminal.prompts import Prompts, Token

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


c = get_config()  # type: ignore # noqa: F821

c.TerminalInteractiveShell.prompts_class = CustomPrompt
c.InteractiveShellApp.extensions = ['autoreload']
c.InteractiveShellApp.exec_lines = ['autoreload 2']
c.TerminalInteractiveShell.editing_mode = 'vi'
c.HistoryManager.hist_file = ':memory:'
c.TerminalInteractiveShell.confirm_exit = False
c.TerminalInteractiveShell.banner1 = banner1()
c.TerminalInteractiveShell.banner2 = banner2()
