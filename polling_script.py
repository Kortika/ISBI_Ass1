
import os
import sys
import argparse
import extract_data

def main(arguments):

    parser = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument('infile', help="Input file", type=str)
    parser.add_argument('-o', '--outfile', help="Output file",
                        default=sys.stdout, type=argparse.FileType('w'))

    args = parser.parse_args(arguments)
    
    print(extract_data.readfile(args.infile))
    
    


if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
