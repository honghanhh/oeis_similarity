from functools import partial

search = partial(search, cache_info={'cache_dir':'./fetched/', 'cache_first':False})

for i in range(360000):
    if len(str(i)) < 6:
        value = str(i).rjust(6, '0')
    searchable = search(A_id='A'+ str(value))
    if i % 1000 == 0:
        print("Checkpoint Done: ", i)
        print(i, 'A'+ str(value))
