# -*- coding: utf-8 -*-
##############################################################################
#
#    OpenERP, Open Source Management Solution
#    Copyright (c) 2013-Present Acespritech Solutions Pvt. Ltd. (<http://acespritech.com>).
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as
#    published by the Free Software Foundation, either version 3 of the
#    License, or (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
##############################################################################

from odoo import models, fields, api, SUPERUSER_ID, _
from odoo.exceptions import UserError, ValidationError
#from odoo.tools import float_is_zero
from odoo.tools.misc import formatLang
from datetime import datetime, timedelta, date
from pytz import timezone
from odoo import tools
import logging

_logger = logging.getLogger(__name__)

# class {{pascalCase name}}(models.AbstractModel):
#     _name = '{{snakeCase name}}.{{snakeCase name}}'

    # @api.multi
    # def render_html(self, data=None):
        # self._get_first_day(data.get('form').get('start_date')
        # data['form']['start_date']=fields.Date.to_string(self._get_first_day(data.get('form').get('start_date')))
        # data['form']['end_date']=fields.Date.to_string(self._get_last_day(data.get('form').get('end_date')))
        # report_obj = self.env['report']
        # report = report_obj._get_report_from_name('{{snakeCase name}}.{{snakeCase name}}')
        # docargs = {
        #     'doc_ids': self.env["wizard.weekly.hours"].browse(data["ids"]),
        #     'doc_model': report.model,
        #     'docs': self,
        #     'get_holidays_list': self._get_holidays_list,
        #     'data': data,
        #     'formatLang': formatLang,
        # }
        # return report_obj.render('{{snakeCase name}}.{{snakeCase name}}', docargs)


    # def _get_holidays_list(self, data):
        # if data.get('form') and data.get('form').get('start_date') and data.get('form').get('end_date'):
            # return data

# vim:expandtab:smartindent:tabstop=4:softtabstop=4:shiftwidth=4:
