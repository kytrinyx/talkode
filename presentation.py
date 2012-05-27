# -*- coding: utf-8 -*-
"""
    Presentation Colorscheme
    ~~~~~~~~~~~~~~~~~~~~

"""
from pygments.style import Style
from pygments.token import Comment, Error, Generic, Keyword, Literal, Name, \
     Operator, Text

class PresentationStyle(Style):

    default_style = ''
    background_color = '#ffffff'

    styles = {
        Comment.Multiline:              'italic #666',
        Comment.Preproc:                'bold #999999',
        Comment.Single:                 'italic #666',
        Comment.Special:                'bold italic #999999',
        Comment:                        'italic #666',

        Error:                          'bg:#e3d2d2 #a61717',
        Generic.Deleted:                'bg:#ffdddd #000000',
        Generic.Emph:                   'italic #000000',
        Generic.Error:                  '#aa0000',
        Generic.Heading:                '#999999',
        Generic.Inserted:               'bg:#ddffdd #000000',
        Generic.Output:                 '#888888',
        Generic.Prompt:                 '#555555',
        Generic.Strong:                 'bold',
        Generic.Subheading:             '#aaaaaa',
        Generic.Traceback:              '#aa0000',
        Keyword.Constant:               'bold #000000 ',
        Keyword.Declaration:            'bold #000000',
        Keyword.Namespace:              'bold #000000',
        Keyword.Pseudo:                 'bold #000000',
        Keyword.Reserved:               'bold #000000',
        Keyword.Type:                   'bold #445588',
        Keyword:                        'bold #000000',
        Literal.Number.Float:           'bold #0000DD',
        Literal.Number.Hex:             'bold #0000DD',
        Literal.Number.Integer.Long:    'bold #0000DD',
        Literal.Number.Integer:         'bold #0000DD',
        Literal.Number.Oct:             'bold #0000DD',
        Literal.Number:                 'bold #0000DD',
        Literal.String.Backtick:        '#d14',
        Literal.String.Char:            '#d14',
        Literal.String.Doc:             '#d14',
        Literal.String.Double:          '#d14',
        Literal.String.Escape:          '#d14',
        Literal.String.Heredoc:         '#d14',
        Literal.String.Interpol:        '#d14',
        Literal.String.Other:           '#d14',
        Literal.String.Regex:           'bg:#e0e0ff #d14',
        Literal.String.Single:          '#d14',
        Literal.String.Symbol:          '#990073',
        Literal.String:                 '#d14',
        Name.Attribute:                 '#008080',
        Name.Builtin.Pseudo:            '#999999',
        Name.Builtin:                   '#0086B3',
        Name.Class:                     'bold #445588',
        Name.Constant:                  '#008080',
        Name.Decorator:                 'bold #3c5d5d',
        Name.Entity:                    '#800080',
        Name.Exception:                 'bold #990000',
        Name.Function:                  'bold #990000',
        Name.Label:                     'bold #990000',
        Name.Namespace:                 '#555555',
        Name.Tag:                       '#000080',
        Name.Variable.Class:            '#008080',
        Name.Variable.Global:           '#008080',
        Name.Variable.Instance:         '#008080',
        Name.Variable:                  '#008080',
        Operator.Word:                  'bold #000000',
        Operator:                       'bold #000000',
        Text.Whitespace:                '#bbbbbb',
    }
