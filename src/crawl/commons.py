
import re, requests, os, json

Axxxxxx_regex = re.compile('(?P<id>A\d{6,6})')

def cross_references(xref):
    return {r for references in xref for r in Axxxxxx_regex.findall(references)}

def json_load(f, cache_dir, add_path_attr=True):
    relative_path = os.path.join(cache_dir, f)
    with open(relative_path, 'r') as handler:
        doc = json.load(handler)
        if add_path_attr:
            doc['relative_path'] = relative_path
        return doc

def cache_reify(cache_dir):
    A_genid = 'Axxxxxx'
    return {json_file[:len(A_genid)]: json_load(json_file, cache_dir)  
            for json_file in filter(lambda f: f.endswith('.json'), os.listdir(cache_dir))}

def fetch_oeis_payload( dolocal, 
                        payload, 
                        then=None, 
                        network_error_handler=lambda exc: None, 
                        json_decoding_error_handler=lambda GET_result, exc: None, 
                        progress_indicator='●'):


    doc = {}
    GET_result = None

    if dolocal.get('cache_first', True):

        cache_dir = dolocal['cache_dir']

        docs = cache_reify(cache_dir)
        
        if 'id' in dolocal:
            doc = docs.get(dolocal['id'], None)

        elif 'seq' in dolocal:
            seq = dolocal['seq']

            def filtering(doc):
                result = doc['results'][0] if doc['results'] else {'data': ''}
                if isinstance(seq, list):
                    looking = ','.join(map(str, seq))
                    return looking in result['data'].replace(' ', '')
                elif isinstance(seq, set):
                    ints = set(map(int, result['data'].split(',')))
                    return seq.issubset(ints)
                return False

            multiple_results = []
            for d in filter(filtering, docs.values()):
                multiple_results.extend(d.get('results', []))
            doc = {'results': multiple_results}

        elif dolocal.get('most_recents', None):
            ordering = os.path.getatime if dolocal['most_recents'] == 'ACCESS' else os.path.getmtime
            multiple_results = []
            for d in sorted(docs.values(), 
                            key=lambda doc: ordering(doc['relative_path']),
                            reverse=True):
                # even tough in a Axxxxxx.json file `results` 
                # should be a list with exactly one object
                multiple_results.extend(d.get('results', [])) 
            doc = {'results': multiple_results}

    if 'results' not in doc:

        try: 
            GET_result = requests.get("https://oeis.org/search", params=payload,)
        except Exception as e: 
            return network_error_handler(e)

        try:
            doc = GET_result.json()

            if 'results' not in doc or not doc['results']: 
                doc['results'] = []

            if 'id' in dolocal and 'cache_dir' in dolocal:
                cache_dir = dolocal['cache_dir']
                relative_path = os.path.join(cache_dir, dolocal['id']+'.json')
                with open(relative_path, 'w') as f:
                    json.dump(doc, f)
                    f.flush()

            if progress_indicator: 
                print(progress_indicator, end='')

        except Exception as e:
            return json_decoding_error_handler(e, GET_result)

    return then(doc, GET_result) if callable(then) else doc

def OEIS_sequenceid(seqid):
    if not Axxxxxx_regex.match(seqid):
        raise ValueError

    return seqid

def seqid_to_ahref(text):
    """
    Return a new string where each occurrence of a sequence ref `Axxxxxx` replaced as `<a href=...>` html tag.
    """
    return Axxxxxx_regex.sub(r'<a href="http://oeis.org/\g<id>">\g<id></a>', text)

# INTERFACES {{{

class interface:

    def dispatch(self, on, payload={}):
        message = self.select(on)
        return message(self, **payload)

    def selector(self, recv):
        raise ValueError('Cannot use `interface` abstract class as real object')

class notebook(interface):

    def select(self, recv):
        return recv.for_notebook

class console(interface):

    def __init__(self, width=80, print_results=True):
        self.width = width
        self.print_results = print_results

    def select(self, recv):
        return recv.for_console

# }}}


