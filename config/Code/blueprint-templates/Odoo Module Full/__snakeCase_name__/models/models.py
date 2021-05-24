# -*- coding: utf-8 -*-

from odoo import models, fields, api, SUPERUSER_ID, _
from odoo.exceptions import UserError, ValidationError
#from odoo.tools import float_is_zero

import logging
_logger = logging.getLogger(__name__)

# class {{pascalCase name}}(models.Model):
#     _name = '{{snakeCase name}}.{{snakeCase name}}'

#     name = fields.Char()
#     value = fields.Integer()
#     value2 = fields.Float(compute="_value_pc", store=True)
#     description = fields.Text()
#
#     @api.depends('value')
#     def _value_pc(self):
#         self.value2 = float(self.value) / 100
#         super({{pascalCase name}}, self)._value_pc()

#    def _compute_website_url(self):
#        for record_id in self:
#            record_id.website_url = '/team/%s' % slug(record_id)

# class {{pascalCase name}}Settings(models.Model):
#     _name = '{{snakeCase name}}.{{snakeCase name}}.settings'
#     _inherit = 'res.config.settings'

#     login = fields.Char("Login")
#     password = fields.Char("Password")

#     @api.multi
#     def set_params(self):
#         self.ensure_one()

#         for field_name, key_name in PARAMS:
#             value = getattr(self, field_name, '').strip()
#             self.env['ir.config_parameter'].set_param(key_name, value)

#     def get_default_params(self, cr, uid, fields, context=None):
#         res = {}
#         for field_name, key_name in PARAMS:
#             res[field_name] = self.env['ir.config_parameter'].get_param(key_name, '').strip()
#         return res
