return {
    'norcalli/nvim-colorizer.lua',
    config = function ()
        local colorizer = require('colorizer')

        colorizer.setup({
            'css';
            'javascript';
            'typescript';
            html = {
                mode = 'foreground';
            }
        })
    end
}
