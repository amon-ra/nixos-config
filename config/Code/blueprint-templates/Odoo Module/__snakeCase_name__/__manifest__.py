# pylint: disable=line-too-long
{
    'name': "{{name}}",

    'summary': """
        Short (1 phrase/line) summary of the module's purpose, used as
        subtitle on modules listing or apps.openerp.com""",

    'author': "Oondeo",
    'website': "https://www.oondeo.es",
    'license': "GPL-3",
    # Categories can be used to filter modules in modules listing
    # Check https://github.com/odoo/odoo/blob/14.0/odoo/addons/base/data/ir_module_category_data.xml # noqa: B950
    # for the full list
    'category': 'Uncategorized',
    'version': '{{ $odoo_version }}.0.1.0.0',

    # any module necessary for this one to work correctly
    'depends': ['base'],

    # any python or binary file necessary
    'external_dependencies': {
        'python': [],
        'bin': [],
    },

    # always loaded
    'data': [
        'security/ir.model.access.csv',
    ],
    # only loaded in demonstration mode
    'demo': [
    ],

    # css files in static/src/css
    'css': [],
    'images': [],

    'pre_init_hook': '',
    'post_init_hook': '',
    'uninstall_hook': '',

    'installable': True,
    'application': False,

}
