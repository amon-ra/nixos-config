# -*- coding: utf-8 -*-
from odoo import http, _

import logging
_logger = logging.getLogger(__name__)

# class {{pascalCase name}}(http.Controller):
#     @http.route('/{{snakeCase name}}/{{snakeCase name}}/', auth='public')
#     def index(self, **kw):
#         return "Hello, world"

#     @http.route('/{{snakeCase name}}/{{snakeCase name}}/objects/', auth='public')
#     def list(self, **kw):
#         return http.request.render('{{snakeCase name}}.listing', {
#             'root': '/{{snakeCase name}}/{{snakeCase name}}',
#             'objects': http.request.env['{{snakeCase name}}.{{snakeCase name}}'].search([]),
#         })

#     @http.route('/{{snakeCase name}}/{{snakeCase name}}/objects/<model("{{snakeCase name}}.{{snakeCase name}}"):obj>/', 
#                  auth='public',type='http', website=True)
#     def object(self, obj, **kw):
#         return http.request.render('{{snakeCase name}}.object', {
#             'main_object': obj,
#             'object': obj
#         })
