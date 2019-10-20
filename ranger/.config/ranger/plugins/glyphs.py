import os
import ranger.api
from ranger.core.linemode import LinemodeBase

predefined_dirnames = {
    'Dropbox':  0xf16b,
    'Dokumenty': 0xf02d
}

@ranger.api.register_linemode
class GlyphLinemode(LinemodeBase):
    name = "glyphs"

    def filetitle(self, file, metadata):
        code = predefined_dirnames.get(file.relative_path, None)
        if code is not None:
            code = chr(code)
            name = file.relative_path
            return f'{code}  {name}'

        if os.path.isdir(file.path):
            return ' ' + ' ' + file.relative_path
        elif os.path.splitext(file.path)[1] == '.txt':
            return ' ' + ' ' + file.relative_path
        else:
            return file.relative_path

