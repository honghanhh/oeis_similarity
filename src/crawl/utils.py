def search( A_id=None, seq=None, query=None, 
            cache_info={'cache_dir': './fetched/', 'most_recents': None, 'cache_first': True},
            interface=notebook(),
            raw_json=False,
            start=0, max_results=None, table=False, xref=[], 
            only_possible_matchings=False, **kwds):

    if cache_info['cache_dir']
    query_components = [] # a list of query components, as strings to be joined later

    if isinstance(A_id, (str, )) and Axxxxxx_regex.match(A_id): 
        query_components.append("id:{}".format(A_id))
        cache_info['id'] = A_id
    elif seq: 
        ready = (", " if isinstance(seq, list) else " ").join(map(str,seq))
        query_components.append(ready)
        cache_info['seq'] = seq
    elif query: 
        query_components.append(query) 

    if table: query_components.append("keyword:tabl")
    for r in xref: query_components.append("xref:A{:06d}".format(A_id))
    for k,v in kwds.items(): query_components.append("{}:{}".format(k,v))

    def connection_error(exc):
        return lambda **pp_kwds: Markdown("<hr>__Connection Error__<hr>")

    def json_error(exc, GET_result):
        return lambda **pp_kwds: Markdown("<hr>__JSON decoding Error__:\n```{}```<hr>".format(GET_result.text))

    def make_searchable(doc, GET_result):

        def searchable(**pp_kwds):

            results = [pretty_print(result, interface, **pp_kwds) 
                                for i, result in enumerate(doc['results']) 
                                if not max_results or i < max_results
                                if 'allocated' not in result['keyword']]

            return interface.dispatch(on=oeis_results_composer(results, doc, GET_result))

        return searchable

    def possible_matchings(doc, GET_result):

        def searchable(term_src):

            matches = [r"<a href='http://oeis.org/A{:06d}'>A{:06d}</a>".format(result['number'], result['number']) 
                       for result in doc['results']]

            return r'<tr><td style="white-space:nowrap;">$${math}$$</td><td>{seqs}</td></tr>'.format(
                math=term_src, seqs=", ".join(matches))

        return searchable

    return fetch_oeis_payload(
                dolocal=cache_info,
                payload={"fmt": "json", "start": start, "q": ' '.join(query_components)},  
                then=(possible_matchings if only_possible_matchings 
                        else None if raw_json 
                        else make_searchable), 
                network_error_handler=connection_error, 
                json_decoding_error_handler=json_error,
                progress_indicator=None)
