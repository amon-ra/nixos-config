
from odoo import models, fields, api, SUPERUSER_ID, _ # noqa: F401
from odoo.exceptions import UserError, ValidationError   # noqa: F401
#from odoo.tools import float_is_zero

import logging
_logger = logging.getLogger(__name__)

class {{pascalCase name}}(models.Model):

    _name = '{{lowerDotCase name}}'
    _description = ''


