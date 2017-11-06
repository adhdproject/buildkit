from pathlib import Path

def map_default(seq, attribute, default=None):
    for v in seq:
        yield v.get(attribute, default)

def map_omit(seq, attribute):
    for v in seq:
        if attribute in v:
            yield v[attribute]

def map_format(seq, format_str):
    for obj in seq:
        args, kwargs = (), {}
        if type(obj) is str:
            args = [obj]
        elif type(obj) is dict:
            kwargs = obj
        else:
            if len(obj) == 2:
                args, kwargs = obj
            else:
                args = obj
        yield format_str.format(*args, **kwargs)

def exists(fname):
    for root in ['.','roles/adhd/tasks']:
        p = Path(root, fname)
        if p.exists():
            return True
    return False

def file_exists(seq):
    for fname in seq:
        if exists(fname):
            yield fname

def lower_all(seq):
    return [v.lower() for v in seq]

def merge_tools(seq):
    merged = {}
    for tools in seq:
        for tool_name in tools:
            new_tools = merged.setdefault(tool_name, {})
            tdict = tools[tool_name]
            for key in tdict:
                if key in new_tools:
                    if type(new_tools[key]) in {list,tuple}:
                        new_tools[key].extend(tdict[key])
                    else:
                        new_tools[key] = tdict[key]
                else:
                    new_tools[key] = tdict[key]
    return merged

class FilterModule(object):
    ''' Filter utilities '''

    def filters(self):
        return {
            'map_default': map_default,
            'map_omit': map_omit,
            'merge_tools': merge_tools,
            'map_format': map_format,
            'file_exists': file_exists,
            'lower_all': lower_all,
        }
