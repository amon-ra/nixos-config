# -*- coding: utf-8 -*-

from odoo import models, fields, api, _
from odoo.exceptions import UserError

import logging
_logger = logging.getLogger(__name__)

# class {{pascalCase name}}(models.TransientModel):
#     _name = '{{snakeCase name}}.wizard'

#     name = fields.Char()
#     value = fields.Integer()
#     value2 = fields.Float(compute="_value_pc", store=True)
#     description = fields.Text()
#
#     @api.depends('value')
#     def _value_pc(self):
#         self.value2 = float(self.value) / 100
#         super({{pascalCase name}}, self)._value_pc()

#     def do_action(self):
#       return {
#           'type': 'ir.actions.client',
#           'tag': 'reload',
#       }
