from .referformer import build
from .onlinerefer import build as build_online

def build_model(args):
    if args.online:
        return build_online(args)
    elif args.semi_online:
        raise Exception(f'Now we does not support semi-online mode.')
    else:
        return build(args)
