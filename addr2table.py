import sys
import argparse

def addr2html(file, num_columns):
    file = open(file, 'r').readlines()
    html_table = '<html>\n  <table>\n    <tr>\n      <th>Target Hosts</th>\n    </tr>\n'
    count = 0
    tr_spacing = ' ' * 4
    td_spacing = ' ' * 6
    for item in file:
        item = item.strip()
        if count == 0:
            html_table += tr_spacing + '<tr>\n'
        html_table += td_spacing + '<td>' + item + '</td>\n'
        count += 1
        if (item == file[-1].strip()) and (count != num_columns):
            html_table += tr_spacing + '</tr>\n'
        if count == num_columns:
            html_table += tr_spacing + '</tr>\n'
            count = 0
    html_table += '  </table>\n</html>'
    print(html_table)


def addr2markdown(file, num_columns):
    file = open(file, 'r').readlines()
    markdown_table = '| Target Addresses |\n'
    count = 0
    col_spacing = ' '
    for item in file:
        item = item.strip()
        if count == 0:
            markdown_table += '|'
        markdown_table += col_spacing + item + col_spacing + '|'
        count += 1
        if (item == file[-1].strip()) and (count != num_columns):
            markdown_table += '\n'
        if count == num_columns:
            markdown_table += '\n'
            count = 0
    print(markdown_table)

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-n','--num-col',help='Specifies the number of columns for the markdown or html table',default=1,type=int,action='store')
    parser.add_argument('-i','--input-file',help='Specifies the file to read the addresses from',required=True,action='store')
    parser.add_argument('-f','--format',help='Defines the table format, either markdown or html',choices=['markdown','html'],type=str.lower,default='html',action='store')
    args = parser.parse_args()
 
    file = args.input_file
    num_columns = int(args.num_col)
    format = args.format
    print(format)
    if format == 'html':

        addr2html(file, num_columns)

    if format == 'markdown':
        addr2markdown(file, num_columns)
    
        sys.exit(1) 
