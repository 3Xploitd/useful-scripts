
import json
import sys
import argparse
from pathlib import Path


def ParseOutputByType(file):
    file = open(file, 'r').read()
    jf = json.loads(file)['bbot_results']
    enumeration_type = set()

    for item in jf:
        enumeration_type.update([item['type']])

    aggregated_scans = {}
    for each in enumeration_type:
        aggregated_scans[each] = []


    for item in jf:
        for type in enumeration_type:
            if item['type'] == type:
                aggregated_scans[item['type']].append(item)

    for item in enumeration_type:
        label = f'{item}_LISTING'
        with open(f'{label}.json','a') as fh:

            fh.write(json.dumps({label:aggregated_scans[item]}, indent=4))
            print(f'[+] Saving all values associated wih the enumeration type of {item} to the current location as {label}.json')
            fh.close()
    return aggregated_scans

def getSubdomains(aggregated_scans):

    dns_scan = aggregated_scans['DNS_NAME_LISTING']

    domain = dns_scan[0]['data']

    sub = {"subdomains": []}

    for dnsname in dns_scan:
        if domain in dnsname['data']:

            sub['subdomains'].append({dnsname['data']:dnsname['resolved_hosts']})

    return sub

def convertNDJSON(file):
    file = open(file,'r').readlines()
    jf = {"bbot_results": []}
    for line in file:
        jf['bbot_results'].append(json.loads(line))
    with open('output.json', 'a') as fh:
        fh.write(json.dumps(jf, indent=4))
        fh.close()
    return jf
      

if __name__ == '__main__':
        parser = argparse.ArgumentParser()
        parser.add_argument('-f','--file',help='JSON input file to parse, the result will generate separate files for the different result types',action='store',required=True)
        parser.add_argument('-j', '--convert-json',help='Converts the NDJSON file bbot outputs by default to JSON so it can be parsed',action='store', default=None )

        args = parser.parse_args()
        if args.convert_json == None:
            if Path(args.file).is_file():
                try:
                  
                    ParseOutputByType(args.file)
                except Exception as e:
                    print(e)
                    sys.exit(1)
            else:
                sys.tracebacklimit=0
                raise Exception('Could not locate the provided file, either it does not exist or the path specified is incorrect')
                sys.exit(1)
        if (args.convert_json and args.file) != None:
            if (Path(args.convert_json).is_file() and Path(args.file).is_file()):
                try:
                    jf = ConvertNDJSON(args.convert_json)
                    ParseOutputbyType(jf)
                except Exception as e:
                    print(e)
                    sys.exit(1)
            else:
                sys.tracebacklimit=0
                raise Exception('Could not locate the provided files, either it does not exist or the path specified is incorrect')
